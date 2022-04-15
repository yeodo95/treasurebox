import 'package:flutter/material.dart';
import 'package:treasurebox/src/widgets/navermap_widget.dart';

class DirectionsPage extends StatefulWidget {
  const DirectionsPage({Key? key}) : super(key: key);

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NaverMap Test')),
      body: const NaverMapWidget(),
    );
  }
}
