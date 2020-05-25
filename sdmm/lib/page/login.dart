
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: FlatButton(
        onPressed: (){
          final user = context.read<UserModel>();
          user.isLogin = true;
        },
        child: Text('button'),
      ),
    );
  }
}
