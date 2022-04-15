import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:treasurebox/api/google_signin_api.dart';
import 'package:treasurebox/src/pages/kakao_login_page.dart';
import 'package:treasurebox/src/pages/loggedin_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _kakaologinButtonPressed() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
    } catch (e) {
      print('카카오톡으로 로그인 실패 $e');
    }
  }

  Future _googleSignIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign In Failed')));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoggedInPage(
          user: user,
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 4,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "반가워요:)",
                    style: new TextStyle(
                      color: Color(0xffFF8E00),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Column(children: [
                    Text(
                      "보물 상자를 만들기 위해서는",
                      style: new TextStyle(
                          color: Color(0xff616161),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "로그인이 필요해요",
                      style: new TextStyle(
                          color: Color(0xff616161),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                )),
            Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: _kakaologinButtonPressed,
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                            onPrimary: Color(0xff616161),
                            minimumSize: Size(183, 45),
                            textStyle: new TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        child: Text(
                          "카카오 로그인",
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // Get.offAllNamed("/lending_page");
                          _googleSignIn();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffF6F6F6),
                            onPrimary: Color(0xff616161),
                            minimumSize: Size(183, 45),
                            textStyle: new TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        child: Text(
                          "구글 로그인",
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
