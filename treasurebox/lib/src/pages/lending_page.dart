import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LendingPage extends StatefulWidget {
  const LendingPage({Key? key}) : super(key: key);

  @override
  State<LendingPage> createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
        shape: Border(bottom: BorderSide(color: Color(0xff616161), width: 1)),
        title: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "상자구경",
                style: new TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "내상자",
                style: new TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed("/directions_page");
              },
              child: Text(
                "장소등록",
                style: new TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(),
    );
  }
}
