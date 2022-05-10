import 'package:flutter/material.dart';

class _myCardTypeList extends StatefulWidget {
  const _myCardTypeList({Key? key}) : super(key: key);

  @override
  State<_myCardTypeList> createState() => __myCardTypeListState();
}

class __myCardTypeListState extends State<_myCardTypeList> {
  final titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];
  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card(
            // <-- Card widget
            child: Container(
          color: Colors.yellow,
          height: 100,
        ));
      },
    );
  }
}
