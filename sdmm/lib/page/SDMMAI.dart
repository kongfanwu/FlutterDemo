import 'package:flutter/material.dart';
import 'package:sdmm/networking/JsonSerializableDemo.dart';

class SDMMAI extends StatefulWidget {
  @override
  _SDMMAIState createState() => _SDMMAIState();
}

class _SDMMAIState extends State<SDMMAI> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
