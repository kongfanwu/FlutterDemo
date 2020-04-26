import 'package:flutter/material.dart';

class SDMMMine extends StatefulWidget {
  @override
  _SDMMMineState createState() => _SDMMMineState();
}

class _SDMMMineState extends State<SDMMMine> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴的对齐方式
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15, top: 25, right: 15, bottom: 0),
                color: Colors.blue,
                child: Image.asset('static/img/head.png',
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('售后美容师'),
                  Row(
                    children: <Widget>[
                      Text('顾客保有130人'),
                      Text('--工作3年'),
                    ],
                  ),
                ],
              ),
              Text('箭头'),
            ],
          ),
          Row(
            children: <Widget>[
              Text('售后美容师')
            ],
          )
        ],
      ),
    );
  }
}
