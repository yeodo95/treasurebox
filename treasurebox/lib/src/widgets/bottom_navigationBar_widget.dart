// import 'package:flutter/material.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: Colors.grey,
//       selectedItemColor: Colors.white,
//       unselectedItemColor: Colors.white.withOpacity(.60),
//       selectedFontSize: 14,
//       unselectedFontSize: 14,
//       currentIndex: _selectedIndex, //현재 선택된 Index
//       onTap: (int index) {
//         print(_selectedIndex);
//         setState(() {
//           _selectedIndex = index;
//         });
//         print(_selectedIndex);
//       },
//       items: [
//         BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
//         BottomNavigationBarItem(label: "viewlist", icon: Icon(Icons.view_list)),
//         BottomNavigationBarItem(
//           label: "icon",
//           icon: Container(
//             child: FlutterLogo(
//               size: 35.0,
//             ),
//           ),
//         ),
//         BottomNavigationBarItem(label: "bookmark", icon: Icon(Icons.bookmark)),
//         BottomNavigationBarItem(label: "Setting", icon: Icon(Icons.settings)),
//       ],
//     );
//   }
// }
