import 'package:flutter/material.dart';

class FormClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FormClass();
  }

}

class _FormClass extends State<FormClass> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  TextEditingController _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: true, // 是否校验
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: '用户名',
                      hintText: '请输入用户名',
                      icon: Icon(Icons.perm_contact_calendar)
                  ),
                  validator: (val) {
                    return val.trim().length > 0 ? null : '请输入用户名';
                  },
                  controller: _userNameController,
                ),
                RaisedButton(
                  child: Text('提交'),
                  onPressed: () {
                    if ((_formKey.currentState as FormState).validate()) {
                      print('提交数据给后台' + _userNameController.text);
                    }
                  },
                )
              ],
            )
          )
        ]
    );
  }
}