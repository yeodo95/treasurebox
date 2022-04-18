import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

class NaverMapWidget extends StatefulWidget {
  const NaverMapWidget({Key? key}) : super(key: key);

  @override
  State<NaverMapWidget> createState() => _NaverMapState();
}

class _NaverMapState extends State<NaverMapWidget> {
  Completer<NaverMapController> _controller = Completer();
  late NaverMapController nmc;
  MapType _mapType = MapType.Basic;

//  현재 위치 가져오기
  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  void getCL() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print(position);
    nmc.moveCamera(
        CameraUpdate.scrollTo(LatLng(position.latitude, position.longitude)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          NaverMap(
            onMapCreated: onMapCreated,
            mapType: _mapType,
            locationButtonEnable: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.566570, 126.978442),
              zoom: 17,
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      // getCurrentLocation().then(
                      //   (value) => {
                      //     nmc.moveCamera(CameraUpdate.scrollTo(
                      //         LatLng(value.latitude, value.longitude)))
                      //   },
                      // );
                      getCL();
                      //nmc.moveCamera(CameraUpdate.zoomIn());
                    },
                    child: Text("+")),
                ElevatedButton(
                    onPressed: () {
                      // NaverMapController controller = _controller;
                      // controller.moveCamera(CameraUpdate.zoomIn());
                      nmc.moveCamera(CameraUpdate.zoomOut());
                    },
                    child: Text("-")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
    Future<CameraPosition> cp = controller.getCameraPosition();
    print("textxtxt $cp");
    nmc = controller;

    print(controller.getCameraPosition());

    cp.then((value) {
      print("ttt $value");
    });
    controller.moveCamera(CameraUpdate.zoomIn());
  }
}
