import 'package:flutter/material.dart';

class ServiceOrder extends StatefulWidget {
  ServiceOrder({this.navBarTitle});
  final String navBarTitle;
  @override
  _ServiceOrderState createState() => _ServiceOrderState();
}

class _ServiceOrderState extends State<ServiceOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(widget.navBarTitle),
        ),
        body: Container(child: Text(widget.navBarTitle),)
    );
  }
}
