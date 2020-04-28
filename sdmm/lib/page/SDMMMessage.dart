import 'package:flutter/material.dart';

class SDMMMessage extends StatefulWidget {
  @override
  _SDMMMessageState createState() => _SDMMMessageState();
}

class _SDMMMessageState extends State<SDMMMessage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('老孟，一个有态度的程序员'),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue
        ),
      ),
    );
  }
}
