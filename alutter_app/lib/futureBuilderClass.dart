import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';

// 异步UI更新

class FWFutureBuilder extends StatefulWidget {
  @override
  _FWFutureBuilderState createState() => _FWFutureBuilderState();
}

class _FWFutureBuilderState extends State<FWFutureBuilder> {

  Future<String> lookUpVersion() async {
    return Future.delayed(Duration(seconds: 2), () => '1');
  }

  Future<String> lookUpVersion2() async {
    return Future.delayed(Duration(seconds: 2), () => '2');
  }

  String lookUpVersion3() {
    return '3';
//    return Future.delayed(Duration(seconds: 2), () => '1.0.1');
  }

  Future<String> checkVersion() async {
    var version = await lookUpVersion();
    print(version);

    var version3 = lookUpVersion3();
    print(version3);

    var version2 = await lookUpVersion2();
    print(version2);
    return '$version-$version2-$version3';
  }

  aprint() async {
    var res = await checkVersion();
  }


//  Future<String> mockNetworkData() async {
////    return Future.error('error12');
////    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
//
//  }
//  Future<void> getData(Function callBack) async {
//    new Timer(Duration(seconds: 2), () {
//      callBack('result');
//      return Future.value('resultvalue');
//    });
//  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: checkVersion(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求已结束
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // 请求失败，显示错误
              return Text("Error: ${snapshot.error}");
            } else {
              // 请求成功，显示数据
              return Text("Contents: ${snapshot.data}");
            }
          } else {
            // 请求未结束，显示loading
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
