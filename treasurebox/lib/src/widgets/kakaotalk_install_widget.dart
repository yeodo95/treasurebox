import 'package:flutter/material.dart';

// class KakaotalkInstallWidget extends StatelessWidget {
//   const KakaotalkInstallWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       content: Text("카카오톡을 설치하시겠습니까?"),
//       actions: [FlatButton(onPressed: () {}, child: Text("예"))],
//     );
//   }
// }

Future<void> KakaotalkInstallWidget(BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("카카오톡 설치가 필요합니다.\n 설치 페이지로 이동하시겠습니까?"),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("예")),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("아니오"))
          ],
        );
      });
}
