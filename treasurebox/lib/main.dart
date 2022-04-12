import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:treasurebox/src/pages/first_page.dart';
import 'package:treasurebox/src/pages/login_page.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '057e31efbe58a7c313ba738937752277');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: "/first_page",
        getPages: [
//          GetPage(name: "/", page: ()=>Home(), transition: Transition.fadeIn),
//          GetPage(name: "/loading", page: ()=>LoadingPage(), transition: Transition.downToUp),
          GetPage(name: "/first_page", page: ()=>FirstPage(), transition: Transition.fadeIn),
          GetPage(name: "/login_page", page: ()=>LoginPage(), transition: Transition.fadeIn)
        ]
    );
  }
}

