import 'package:flutter/material.dart';

class LendingPage extends StatefulWidget {
  const LendingPage({Key? key}) : super(key: key);

  @override
  State<LendingPage> createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lending Page"),
      ),
      endDrawer: Drawer(

      ),
    );
  }
}
