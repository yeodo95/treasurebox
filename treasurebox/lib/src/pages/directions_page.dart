import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:treasurebox/api/naver_map_api.dart';
import 'package:treasurebox/src/class/userInfo.dart';

class DirectionsPage extends StatefulWidget {
  @override
  _DirectionsPageState createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  static const MODE_HOME = 0xF1;
  static const MODE_MAP = 0xF2;
  static const MODE_MYPAGE = 0xF3;
  int _currentMode = MODE_HOME;
  bool bShowbottomSheet = false;
  int _selectedIndex = 0;

  userInfo user = new userInfo.fromMap({'name': '여도현', 'id': 'yeodo'});

  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState() {
    setState(() {
      _markers.add(Marker(
          markerId: 'Clicked',
          position: LatLng(37.563600, 126.962370),
          captionText: "커스텀 아이콘",
          captionColor: Colors.indigo,
          captionTextSize: 20.0,
          alpha: 0.8,
          captionOffset: 30,
          anchor: AnchorPoint(0.5, 1),
          infoWindow: '인포 윈도우',
          onMarkerTab: _onMarkerTap));
    });

    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   OverlayImage.fromAssetImage(
    //     assetName: 'icon/marker.png',
    //   ).then((image) {
    //     setState(() {
    //       _markers.add(Marker(
    //           markerId: 'id',
    //           position: LatLng(37.563600, 126.962370),
    //           captionText: "커스텀 아이콘",
    //           captionColor: Colors.indigo,
    //           captionTextSize: 20.0,
    //           alpha: 0.8,
    //           captionOffset: 30,
    //           icon: image,
    //           anchor: AnchorPoint(0.5, 1),
    //           width: 30,
    //           height: 30,
    //           infoWindow: '인포 윈도우',
    //           onMarkerTab: _onMarkerTap));
    //     });
    //   });
    // });

    if (Get.arguments != null) {
      _markers = Get.arguments;
      print('ok');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: <Widget>[
              _lending(),
              _naverMap(),
              _bottomSheet(),
              _mapController(),
            ],
          ),
          bottomNavigationBar: _bottomNavBar()),
    );
  }

  Widget _mapController() {
    return Visibility(
      visible: _currentMode == MODE_MAP ? true : false,
      child: Container(
        alignment: Alignment.bottomRight,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
              onPressed: () async {
                print("push bearing");
                final NaverMapController controller = await _controller.future;
                LocationOverlay(controller).setBearing(90.0);
                // controller.locationOverlay?.setBearing(90.0);
                // print(controller.locationOverlay);
              },
              icon: Icon(Icons.explore_outlined)),
          IconButton(
              onPressed: () async {
                print("push +");
                final NaverMapController controller = await _controller.future;
                controller.moveCamera(CameraUpdate.zoomIn());
              },
              icon: Icon(Icons.add_circle_outline)),
          IconButton(
              onPressed: () async {
                print("push -");
                final NaverMapController controller = await _controller.future;
                controller.moveCamera(CameraUpdate.zoomOut());
              },
              icon: Icon(Icons.remove_circle_outline)),
        ]),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.black,
      currentIndex: _selectedIndex, //현재 선택된 Index
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
          //bShowbottomSheet = true;
          _currentMode = 241 + index;
          print(_markers.length);
        });
      },
      items: [
        // BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
        // BottomNavigationBarItem(label: "viewlist", icon: Icon(Icons.view_list)),
        // BottomNavigationBarItem(
        //     label: "add",
        //     icon: Icon(
        //       Icons.add,
        //       size: 35,
        //     )),
        // BottomNavigationBarItem(label: "bookmark", icon: Icon(Icons.bookmark)),
        BottomNavigationBarItem(label: "home", icon: Icon(Icons.home_outlined)),
        BottomNavigationBarItem(label: "map", icon: Icon(Icons.map_outlined)),
        BottomNavigationBarItem(
            label: "user", icon: Icon(Icons.account_circle_outlined)),
      ],
    );
  }

  _bottomSheet() {
    return Visibility(
      visible: bShowbottomSheet,
      child: SlidingUpPanel(
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
    );
  }

  _lending() {
    return Visibility(
      visible: _currentMode == MODE_HOME ? true : false,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${user.userName}님\n',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                            text: '안녕하세요.',
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.account_circle_rounded,
                      size: 60,
                    ),
                  ]),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff8DBBFF)),
              child: Container(
                height: 85,
                padding: EdgeInsets.only(left: 20, right: 50),
                width: MediaQuery.of(context).size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "장소상자",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${user.aroundPlace}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '내 주변',
                            style: TextStyle(
                              color: Color(0xff616161),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${user.myPlace}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '내 장소',
                            style: TextStyle(
                              color: Color(0xff616161),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("방금 전 등록된 곳이에요!"),
            ),
            Expanded(
              child: Container(
                  child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text("test"),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text("test"),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Text("test"),
                      ),
                      Card(
                        margin: EdgeInsets.only(bottom: 5),
                        child: ListTile(
                          contentPadding: EdgeInsets.only(right: 12),
                          leading: Container(
                            width: 140,
                            height: 100,
                            color: Colors.black,
                          ),
                          title: Text("test"),
                          subtitle: Text("test \n\n\n\nsubtitle"),
                          onTap: () {
                            print("tap card");
                          },
                        ),
                      ),
                    ],
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  _naverMap() {
    return Visibility(
      visible: _currentMode == MODE_MAP ? true : false,
      child: NaverMap(
        onMapCreated: _onMapCreated,
        onMapTap: _onMapTap,
        onSymbolTap: _onSymbolTap,
        markers: _markers,

        // initLocationTrackingMode: LocationTrackingMode.Follow,
      ),
    );
  }

  // ================== method ==========================

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
  }

  void _onMapTap(LatLng latLng) {
    setState(() {
      bShowbottomSheet = false;
    });
    print(latLng);
    // print(_markers);
    // Get.toNamed(
    //   "/adding_page",
    //   arguments: [latLng, _markers],
    // );
  }

  void _onSymbolTap(LatLng? latLng, String? str) {
    print(str);

    setState(() {
      _markers[0].position = latLng;
    });
  }

  void Function()? _onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
    int pos = _markers.indexWhere((m) => m.markerId == marker?.markerId);
    setState(() {
      _markers[pos].captionText = '선택됨';
      bShowbottomSheet = true;
    });
    // if (_currentMode == MODE_REMOVE) {
    //   setState(() {
    //     _markers.removeWhere((m) => m.markerId == marker?.markerId);
    //   });
    // }

    //하단 모달 띄우기
  }
}
