import 'package:flutter/material.dart';

class TextFieldClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldClass();
  }

}

class _TextFieldClass extends State<TextFieldClass> {

  // 创建编辑回调控制器
  TextEditingController _pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // 在build方法里，注册
    _pwdController.addListener(() {
      print('_pwdController' + _pwdController.text);
    });
    return new Column(
      children: <Widget>[
        TextField(
          autocorrect: true, // 自动获取焦点
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '请输入用户名',
            prefixIcon: Icon(Icons.assignment_ind) // 前置图片
          ),
          keyboardType: TextInputType.number, // 键盘类型
          onChanged: (val) { // 获取输入回调方式一
            print('onChange' + val);
          },
          controller: _pwdController, // 获取输入回调方式二。一般都用此方法解耦合
        )
      ],
    );
  }

}