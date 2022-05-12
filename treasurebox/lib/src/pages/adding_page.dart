import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';

class AddingPage extends StatefulWidget {
  AddingPage({Key? key}) : super(key: key);

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        // extendBodyBehindAppBar: true,
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: ListView(
              children: [
                Text(
                  "가게 등록",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8DBBFF)),
                ),
                SizedBox(height: 30),
                Text(
                  "상호명[필수]",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff616161),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10, bottom: 5),
                  ),
                  cursorHeight: 20,
                ),
                SizedBox(height: 20),
                Text(
                  "주소[필수]",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff616161),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromARGB(128, 97, 97, 97),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$address"),
                      GestureDetector(
                        child: Icon(Icons.search),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => KpostalView(
                                useLocalServer: true,
                                localPort: 8080,
                                kakaoKey: '30b6c3b41a9f2df1df4e772ae60b7c20',
                                callback: (Kpostal result) {
                                  setState(() {
                                    this.postCode = result.postCode;
                                    this.address = result.address;
                                    this.latitude = result.latitude.toString();
                                    this.longitude =
                                        result.longitude.toString();
                                    this.kakaoLatitude =
                                        result.kakaoLatitude.toString();
                                    this.kakaoLongitude =
                                        result.kakaoLongitude.toString();
                                  });
                                  print("$kakaoLatitude , $kakaoLongitude");
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "영업시간",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff616161),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10, bottom: 5),
                  ),
                  cursorHeight: 20,
                ),
                SizedBox(height: 20),
                Text(
                  "사진 첨부하기(최대3장)",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff616161),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(60, 196, 196, 196),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 65,
                        height: 58,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: 13,
                        )),
                      ),
                      Container(
                        width: 65,
                        height: 58,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: 13,
                        )),
                      ),
                      Container(
                        width: 65,
                        height: 58,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "리뷰",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff616161),
                  ),
                ),
                Container(
                  height: 135,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(60, 196, 196, 196),
                    border: Border.all(
                      color: Colors.black,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        "/directions_page",
                        arguments: LatLng(double.parse(kakaoLatitude),
                            double.parse(kakaoLongitude)),
                      );
                    },
                    child: Text("추가하기"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff8DBBFF),
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
