
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:sdmm/model/user_model.dart';
import 'package:sdmm/public/tool.dart';

import 'package:flutter/material.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'package:flui/flui.dart';
import 'package:provider/provider.dart';

/* 遗留问题
* 1 账号需要正则校验
* 2 弹出键盘有警告
* 3 登录后的 userModel 怎么替换成状态管理的 user
* */

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TapGestureRecognizer _xieyiTap = new TapGestureRecognizer();
    TapGestureRecognizer _tiaokuanTap = new TapGestureRecognizer();

    /* 登录 */
    void loginClick() {
      // 校验数据
      if ((_formKey.currentState as FormState).validate()) {
        final url = 'v5.login/index';
        Map<String, dynamic> params = {};
        params['account'] = _phoneController.text;
        params['password'] = Tool.xmhMD5(_pwdController.text);
        var dismiss = FLToast.loading(text: 'Loading...');
        DioManager.getInstance().post(url, params, (data) {
          dismiss();
          final loginUser = UserModel.fromJson(data['data']);
          final user = context.read<UserModel>();
          // 妈了个巴子的，这里不知道怎么将 loginUser 替换成状态管理的 user 暂且硬写吧
          user.id = loginUser.id;
          user.manage_type = loginUser.manage_type;
          user.name = loginUser.name;
          user.phone = loginUser.phone;
          user.password = loginUser.password;
          user.token = loginUser.token;
          user.join_code = loginUser.join_code;
          user.setIsLogin(true);
        }, (error) {
          dismiss();
        });
      }
    }

    @override
    void dispose() {
      //用到GestureRecognizer的话一定要调用其dispose方法释放资源
      _xieyiTap.dispose();
      _tiaokuanTap.dispose();
      super.dispose();
    }

    return Scaffold(
//      resizeToAvoidBottomInset: false, // 这种方法大部分是为了不让软键盘挤压导致页面Widget 变形。并且没有挤压警告。但是会有遮挡问题。所以不采用。
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Column(
              children: <Widget>[
                SizedBox(height: 100,),
                Image.asset('static/img/login_logo.png', fit: BoxFit.cover, width: 296/3, height: 405/3,),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: Form(
                    key: _formKey,
                    autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: '请输入用户名',
                            enabledBorder: UnderlineInputBorder( // 没有焦点时将起作用
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder( // 成为焦点时它将起作用
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (val) {
                            return val.trim().length == 11 ? null : '请输入用户名';
                          },
                          controller: _phoneController,
                        ),
                        TextFormField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: '请输入密码',
                            enabledBorder: UnderlineInputBorder( // 没有焦点时将起作用
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder( // 成为焦点时它将起作用
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (val) {
                            return val.trim().length > 1  ? null : '密码格式不对';
                          },
                          controller: _pwdController,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: RaisedButton(
                                  child: Text('登录'),
                                  textColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  onPressed: loginClick,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
//              Expanded(
//                flex: 1,
//                child: Container(
//                  padding: const EdgeInsets.only(bottom: 34),
//                  child: Align(
//                    alignment: Alignment.bottomCenter,
//                    child: Text.rich(TextSpan(
//                        children: [
//                          TextSpan(
//                            text: '登录即表示同意',
//                            style: TextStyle(fontSize: 12),),
//                          TextSpan(
//                              text: '神灯妈妈用户协议',
//                              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
//                              recognizer: _xieyiTap..onTap = () {
//                                print('神灯妈妈用户协议');
//                              }
//                          ),
//                          TextSpan(
//                              text: '和',
//                              style: TextStyle(fontSize: 12)),
//                          TextSpan(
//                              text: '隐藏条款',
//                              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 12),
//                              recognizer: _tiaokuanTap..onTap = () {
//                                print('隐藏条款');
//                              }
//                          ),
//                        ]
//                    )),
//                  ),
//                ),
//              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56
//MediaQuery.of(context).size.height-24-56-56,