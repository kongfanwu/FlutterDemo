import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class futureBuilderClass extends StatefulWidget {
  @override
  _futureBuilderClassState createState() => _futureBuilderClassState();
}

class _futureBuilderClassState extends State<futureBuilderClass> {

  var _future = Future.delayed(Duration(seconds: 3), () {
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

  Widget createFutureBuilder2() {

  }
  @override
  Widget build(BuildContext context) {
    return createFutureBuilder1();
  }
}
