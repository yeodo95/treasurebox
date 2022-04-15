import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapWidget extends StatefulWidget {
  const NaverMapWidget({Key? key}) : super(key: key);

  @override
  State<NaverMapWidget> createState() => _NaverMapState();
}

class _NaverMapState extends State<NaverMapWidget> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          NaverMap(
            onMapCreated: onMapCreated,
            mapType: _mapType,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.566570, 126.978442),
              zoom: 17,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("test")),
        ],
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
    Future<CameraPosition> cp = controller.getCameraPosition();
    print("textxtxt $cp");
    print(controller.getCameraPosition());

    cp.then((value) {
      print("ttt $value");
    });
  }
}
