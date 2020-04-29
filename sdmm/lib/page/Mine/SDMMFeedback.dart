import 'package:flutter/material.dart';

class SDMMFeedBack extends StatefulWidget {

  SDMMFeedBack({this.navBarTitle});

  final String navBarTitle;

  @override
  _SDMMFeedBackState createState() => _SDMMFeedBackState();
}

class _SDMMFeedBackState extends State<SDMMFeedBack> {

  Widget createInputView() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 25, bottom: 25, left: 10),
          child: Text("留下宝贵意见，会有意外惊喜呦！"),
        ),
        Container(
          height: 150,
//          color: Colors.cyan,
          padding: EdgeInsets.only(top: 0, bottom: 25, left: 10, right: 10),
          child: TextField(
            maxLines: 10,
            autocorrect: true, // 自动获取焦点
            keyboardType: TextInputType.text, // 键盘类型
            decoration: InputDecoration(
              hintText: 'hintText',
              fillColor: Colors.black12,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            onChanged: (val) { // 获取输入回调方式一
              print('onChange' + val);
            },
          ),
        ),
      ],
    );
  }

  Widget createCenterView() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(''),

        ],
      );,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: Column(
        children: <Widget>[
          createInputView(),
          createCenterView(),
        ],
      )
    );
  }
}
