import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:treasurebox/src/widgets/kakaotalk_install_widget.dart';
import 'package:treasurebox/api/google_signin_api.dart';
import 'package:treasurebox/src/pages/kakao_login_page.dart';
import 'package:treasurebox/src/pages/loggedin_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _kakaologinButtonPressed() async {
    try {
      isKakaoTalkInstalled();
      print("is installed");
    } catch (e) {
      print("kakaotalk isn't installed");
      KakaotalkInstallWidget(context);

      return;
    }

    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공 ${token.accessToken}');
      Get.toNamed("/directions_page");
    } catch (e) {
      print('카카오톡으로 로그인 실패 $e');
      Get.toNamed("/directions_page");
    }

    // try {
    //   AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
    //   print('토큰 정보 보기 성공'
    //       '\n회원정보: ${tokenInfo.id}'
    //       '\n만료시간: ${tokenInfo.expiresIn} 초'
    //       '\n앱아이디: ${tokenInfo.appId}');
    // } catch (error) {
    //   print('토큰 정보 보기 실패 $error');
    // }
    // try {
    //   User user = await UserApi.instance.me();
    //   print('사용자 정보 요청 성공'
    //       '\n회원번호: ${user.id}'
    //       '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
    //       '\n이메일: ${user.kakaoAccount?.name}');
    // } catch (error) {
    //   print('사용자 정보 요청 실패 $error');
    // }
  }

  Future _googleSignIn() async {
    final user = await GoogleSignInApi.login();
    final GoogleSignInAuthentication token = await user!.authentication;
    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign In Failed')));
    } else {
      String? it = token.idToken;
      String? at = token.accessToken;
      print("id token - $it ");
      print(token.obs);
      print("access token - $at");

      var url =
          Uri.parse('https://treasure-box-04.herokuapp.com/users/google/');

      http.Response response = await http.post(
        url,
        body: <String, String>{
          'access_token': '$at',
        },
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response.body)));

      print(response.body);

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
                        onPressed: () async {
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
