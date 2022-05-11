// import 'package:flutter/material.dart';
// import 'package:flutter_naver_map/flutter_naver_map.dart';
// import 'package:get/get.dart';

// class AddingPage extends StatelessWidget {
//   AddingPage({Key? key}) : super(key: key);
//   LatLng? Pos = Get.arguments[0];
//   List<Marker> _markers = Get.arguments[1];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("위치 추가"),
//         ),
//         body: Container(
//           child: Column(children: [
//             Text("a,b : $Pos"),
//             ElevatedButton(
//                 onPressed: () {
//                   _markers.add(Marker(
//                     markerId: DateTime.now().toIso8601String(),
//                     position: Pos,
//                     infoWindow: '테스트',
//                   ));

//                   ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: const Text("Save Done!")));

//                   Get.toNamed(
//                     "/directions_page",
//                     arguments: _markers,
//                   );
//                 },
//                 child: Text("확인")),
//           ]),
//         ),
//       ),
//     );
//   }
// }
