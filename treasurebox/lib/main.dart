import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:treasurebox/src/pages/adding_page.dart';
import 'package:treasurebox/src/pages/directions_page.dart';
import 'package:treasurebox/src/pages/intro_page.dart';
import 'package:treasurebox/src/pages/lending_page.dart';
import 'package:treasurebox/src/pages/login_page.dart';
import 'package:treasurebox/src/pages/modal_test_page.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '4a21a7b3ad5990d5d419f7cea1f4f57d');
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
          primarySwatch: Colors.grey,
        ),
        initialRoute: "/intro_page",
        getPages: [
//          GetPage(name: "/", page: ()=>Home(), transition: Transition.fadeIn),
//          GetPage(name: "/loading", page: ()=>LoadingPage(), transition: Transition.downToUp),
          GetPage(
              name: "/intro_page",
              page: () => const IntroPage(),
              transition: Transition.fadeIn),
          GetPage(
              name: "/login_page",
              page: () => const LoginPage(),
              transition: Transition.fadeIn),
          GetPage(
              name: "/lending_page",
              page: () => const LendingPage(),
              transition: Transition.fadeIn),
          GetPage(
              name: "/directions_page",
              page: () => DirectionsPage(),
              transition: Transition.fadeIn),
          GetPage(
              name: "/adding_page",
              page: () => AddingPage(),
              transition: Transition.cupertinoDialog),
          GetPage(
              name: "/modal_page",
              page: () => ModalTest(),
              transition: Transition.downToUp),
        ]);
  }
}
