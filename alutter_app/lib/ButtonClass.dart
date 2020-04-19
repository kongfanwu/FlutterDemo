import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ButtonClassState();
  }

}

class ButtonClassState extends State<ButtonClass> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        // 悬浮按钮
        RaisedButton(
          child: Text('悬浮按钮'),
          onPressed: () => {
            print('RaisenButton Pressed')
          },
        ),
        FlatButton(
          child: Text('FlatButton'),
          onPressed: () => {
            print('FlatButton Pressed')
          },
        ),
        OutlineButton(
          child: Text('OutlineButton'),
          onPressed: () => {
            print('OutlineButton Pressed')
          },
        ),
        FlatButton(
          child: Text('FlatButton自定义'),
          color: Colors.blue,
          textColor: Colors.red,
          highlightColor: Colors.yellow,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), // 圆角
          onPressed: () => {
            print('FlatButton 自定义 Pressed')
          },
        ),
      ],
    );
  }

}
