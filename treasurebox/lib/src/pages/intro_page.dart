import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasurebox/src/pages/login_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _currentOpacity = 1;
  bool _visible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(microseconds: 500), () {
      setState(() {
        _visible = !_visible;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        Get.offAllNamed("/login_page");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8DBBFF),
      body: Container(
          alignment: Alignment(0, 0),
          // padding: EdgeInsets.only(left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                child: Image(image: AssetImage('assets/images/title.png')),
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 1200),
              ),

              // Visibility(
              //   visible: false,
              //   child: AnimatedOpacity(
              //     child: Text("나만의 장소를 모아두는"),
              //     opacity: _visible ? 1.0 : 0.0,
              //     duration: Duration(milliseconds: 1200),
              //   ),
              // ),
            ],
          )),
    );
  }
}
