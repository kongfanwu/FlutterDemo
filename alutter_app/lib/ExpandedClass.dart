
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1, // 相对 row 里的 widget 总占比例
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}