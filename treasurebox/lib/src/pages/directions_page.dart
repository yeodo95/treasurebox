import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:treasurebox/api/naver_map_api.dart';

class DirectionsPage extends StatefulWidget {
  @override
  _DirectionsPageState createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  bool bShowbottomSheet = false;
  int _selectedIndex = 0;

  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState() {
    setState(() {
      _markers.add(Marker(
          markerId: 'id',
          position: LatLng(37.563600, 126.962370),
          captionText: "커스텀 아이콘",
          captionColor: Colors.indigo,
          captionTextSize: 20.0,
          alpha: 0.8,
          captionOffset: 30,
          anchor: AnchorPoint(0.5, 1),
          width: 30,
          height: 30,
          infoWindow: '인포 윈도우',
          onMarkerTab: _onMarkerTap));
    });
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'icon/marker.png',
      ).then((image) {
        setState(() {
          _markers.add(Marker(
              markerId: 'id',
              position: LatLng(37.563600, 126.962370),
              captionText: "커스텀 아이콘",
              captionColor: Colors.indigo,
              captionTextSize: 20.0,
              alpha: 0.8,
              captionOffset: 30,
              icon: image,
              anchor: AnchorPoint(0.5, 1),
              width: 30,
              height: 30,
              infoWindow: '인포 윈도우',
              onMarkerTab: _onMarkerTap));
        });
      });
    });

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
              _naverMap(),
              _bottomSheet(),
              _mapController(),
            ],
          ),
          bottomNavigationBar: _bottomNavBar()),
    );
  }

  Widget _mapController() {
    return Container(
      alignment: Alignment.bottomRight,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
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
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),

      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: _selectedIndex, //현재 선택된 Index
      onTap: (int index) {
        print(_selectedIndex);
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      items: [
        BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: "viewlist", icon: Icon(Icons.view_list)),
        BottomNavigationBarItem(
            label: "add",
            icon: Icon(
              Icons.add,
              size: 35,
            )),
        BottomNavigationBarItem(label: "bookmark", icon: Icon(Icons.bookmark)),
        BottomNavigationBarItem(label: "Setting", icon: Icon(Icons.settings)),
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

  _naverMap() {
    return NaverMap(
      onMapCreated: _onMapCreated,
      onMapTap: _onMapTap,
      markers: _markers,

      // initLocationTrackingMode: LocationTrackingMode.Follow,
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
