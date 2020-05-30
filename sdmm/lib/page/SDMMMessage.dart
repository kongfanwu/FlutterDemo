import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:flui/flui.dart';

class SDMMMessage extends StatefulWidget {
  @override
  _SDMMMessageState createState() => _SDMMMessageState();
}

class _SDMMMessageState extends State<SDMMMessage> {

  void _getIPAddress() {
    final url = 'v5.login/index';
    Map<String, dynamic> params = {};
    params['account'] = '18600004444';
    params['password'] = '21218cca77804d2ba1922c33e0151105';
    var dismiss = FLToast.loading(text: 'Loading...');
//    DioManager.getInstance().post(url, params, (data) {
//      dismiss();
//      print(data);
//      final user = UserModel.fromJson(data['data']);
//      print(user.name);
//    }, (error) {
//      dismiss();
//      print(error);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: () {
            _getIPAddress();

//            FLToast.text(text: 'Here is text');
          },

          child: new Text('Get IP address'),
        ),
      ),
    );
  }
}
