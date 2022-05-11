import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';

class AddingPage extends StatelessWidget {
  AddingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        // extendBodyBehindAppBar: true,
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "한",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8DBBFF)),
                ),
                SizedBox(height: 5),
                Text(
                  "가게 주소",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  "운영 시간",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff616161),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "평일 00:00 ~ 00:00 / 주말 00:00 ~ 00: 00",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(height: 5),
                Text(
                  "리뷰",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff616161),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
