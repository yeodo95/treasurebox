import 'dart:async';

import 'package:flutter_naver_map/flutter_naver_map.dart';

class NaverMapApi {
  static final Completer<NaverMapController> _controller =
      Completer<NaverMapController>();

  LatLng _target = LatLng(0, 0);
  // CameraPosition cameraPosition = new CameraPosition(
  //   target: _target,
  // );
  static Future zoomIn() async {
    final NaverMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.zoomOut());
  }
}
