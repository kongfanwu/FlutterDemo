import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:flui/flui.dart';
import 'package:sdmm/page/SDMMBase/gradient_button.dart';
import 'package:sdmm/page/SDMMBase/search_view.dart';

class SDMMMessage extends StatefulWidget {
  @override
  _SDMMMessageState createState() => _SDMMMessageState();
}

class _SDMMMessageState extends State<SDMMMessage> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController.addListener(() {
      print('controller = ${_textFieldController.text}');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GradientButton(
          borderRadius: BorderRadius.circular(22),
          colors: [Color.fromARGB(255, 248, 115, 66), Color.fromARGB(255, 231, 52, 98)],
          height: 30.0,
          child: Text('搜索'),
          onPressed: (){

          },
        ),
        SearchView(
          hintText:'输入顾客姓名/手机号',
          padding: EdgeInsets.only(left: 20, right: 20),
          textFieldController: _textFieldController,
          onSearchPressed: (text){
            print('onSearchPressed = $text');
          },
        ),
      ],
    );
  }
}
