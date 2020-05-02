import 'package:flutter/material.dart';

class SDMMBasePage extends StatefulWidget {

  SDMMBasePage({this.navBarTitle});

  String navBarTitle;

  @override
  State createState() => _SDMMBasePageState();
}

class _SDMMBasePageState extends State<SDMMBasePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SDMMBasePage'),
    );
  }
}
