import 'package:flutter/material.dart';
import 'package:treasurebox/src/widgets/modal_bottom_sheet.dart';

class ModalTest extends StatelessWidget {
  const ModalTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Modal Button Sheet"),
        ),
        body: Center(
            child: Column(
          children: [
            // buildButton(
            //   text: "SimpleSheet",
            //   onClicked: () => showModalBottomSheet(
            //     context: context,
            //     builder: (context) => (),
            //     useRootNavigator: true,
            //   ),
            // ),
            // buildButton(
            //   text: "Full Screen Sheet",
            //   onClicked: () => showModalBottomSheet(
            //     context: context,
            //     builder: (){}
            //   ),
            // ),
          ],
        )),
      ),
    );
  }

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 30)),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );

  Widget buildSheet() => Container();
}
