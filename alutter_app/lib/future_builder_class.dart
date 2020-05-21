import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class futureBuilderClass extends StatefulWidget {
  @override
  _futureBuilderClassState createState() => _futureBuilderClassState();
}

class _futureBuilderClassState extends State<futureBuilderClass> {

  var _future = Future.delayed(Duration(seconds: 3), () {
//    return Future.error(error)
    return '老孟，一个有态度的程序员';
  });

  Widget createFutureBuilder1() {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        var widget;
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            widget = Icon(
              Icons.error,
              color: Colors.red,
              size: 48,
            );
          } else {
            widget = Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 36,
            );
          }
        } else {
          widget = Padding(
            padding: EdgeInsets.all(20),
            child: CircularProgressIndicator(),
          );
        }

        return Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: widget,
          ),
        );
      },
    );
  }

  Dio _dio = new Dio();

  Widget createFutureBuilder2() {
    return FutureBuilder(
        future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //请求完成
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            //发生错误
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            //请求成功，通过项目信息构建用于显示项目名称的ListView
            return ListView(
              children: response.data.map<Widget>((e) =>
                  ListTile(title: Text(e["full_name"]))
              ).toList(),
            );
          }
          //请求未完成时弹出loading
          return CircularProgressIndicator();
        }
    );
  }
  @override
  Widget build(BuildContext context) {

    return createFutureBuilder2();
  }
}
