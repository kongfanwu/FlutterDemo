import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sdmm/networking/DioManager.dart';

class SDMMWork extends StatefulWidget {
  @override
  _SDMMWorkState createState() => _SDMMWorkState();
}

class _SDMMWorkState extends State<SDMMWork> {
  List dataList = new List();

  void _getIPAddress() {
    DioManager.getInstance().get('http://www.weather.com.cn/data/cityinfo/101010100.html', successCallBack: (data) {
      setState(() {
        dataList = (data['weatherinfo'] as Map).values.toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              _getIPAddress();
            },

            child: new Text('Get IP address'),
          ),
          Container(
            color: Colors.red,
            width: 200,
            height: 300,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Text(dataList[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
              itemCount: dataList.length,
            ),
          ),
        ],
      ),
    );
  }
}
