import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:treasurebox/api/google_signin_api.dart';
import 'package:treasurebox/src/pages/login_page.dart';

class LoggedInPage extends StatelessWidget {
  final GoogleSignInAccount user;

  const LoggedInPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
            child: Text(
              "Logout",
              style: new TextStyle(color: Colors.black),
            ),
            onPressed: () async {
              await GoogleSignInApi.logout();

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
            },
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Profile",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          CircleAvatar(
            radius: 40,
            //backgroundImage: NetworkImage(user.photoUrl!),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Name: ' + user.displayName!,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ]),
      ),
    );
  }
}
