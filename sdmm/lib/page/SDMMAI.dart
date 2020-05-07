import 'package:flutter/material.dart';
import 'package:sdmm/networking/JsonSerializableDemo.dart';

class SDMMAI extends StatefulWidget {
  @override
  _SDMMAIState createState() => _SDMMAIState();
}

class _SDMMAIState extends State<SDMMAI> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new RaisedButton(
        onPressed: () {
          JsonSerializableDemo();
        },
        child: new Text('Get IP address'),
      ),
    );
  }
}
