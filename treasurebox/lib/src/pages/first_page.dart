import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treasurebox/src/pages/login_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 11,
            child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/first_page_background.png')
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Text(
                      "Treasure\nBox",
                      style: new TextStyle(
                          fontSize: 32,
                          color: Color(0xff616161),
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                )
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.topLeft,
//                color: Colors.yellow,
                child: Text.rich(
                    TextSpan(
                        style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(text: "기억", style: TextStyle(color: Color(0xffFF8E00))),
                          TextSpan(text: "하고 싶은 장소를 모아 두는\n나만의 보물 상자", style: TextStyle(color: Color(0xff616161))),
                        ]
                    )
                )
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Container(
//                color: Colors.deepOrangeAccent,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                    onPressed: (){
                      Get.toNamed("/login_page");
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xffFFC985),
                        textStyle: TextStyle(color: Color(0xff616161),fontSize: 16)
                    ),
                    child: Text("시작하기", style: TextStyle(color: Color(0xff616161)),)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
