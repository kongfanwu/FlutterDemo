import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdmm/page/SDMMBase/SDMMRow.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'dart:convert';
import 'package:flutter_picker/flutter_picker.dart';
import 'PickerData.dart';

import 'package:flutter/services.dart';

class SDMMUserInfoSubmitModel {
  String name, phone, gender, genderId, carId, date, address;
}

class SDMMUserDetail extends StatefulWidget {
  @override
  _SDMMUserDetailState createState() {
    return _SDMMUserDetailState();
  }
}

class _SDMMUserDetailState extends State<SDMMUserDetail> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var _userInfoModel = SDMMUserInfoSubmitModel();
  var _cityJson;

  // 年月日picker
  showPickerArray(BuildContext context) {
    DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime(2018, 3, 5),
      maxTime: DateTime(2022, 6, 7), onChanged: (date) {
        print('change $date');
      },
      onConfirm: (date) {
        print('confirm $date');
        print('confirm ${date.toString()}');
        setState(() {
          _userInfoModel.date = '${date.year}-${date.month}-${date.day}';
        });
      },
      currentTime: DateTime.now(), locale: LocaleType.zh
    );
  }

  // 选择性别picker
  showGenderPicker() {
    final adapter = PickerDataAdapter(data: [
      PickerItem(value: '男'),
      PickerItem( value: '女'),
    ]);

    Picker picker = Picker(
      adapter: adapter,
      changeToFirst: false,
      textAlign: TextAlign.left,
      textStyle: const TextStyle(color: Colors.blue),
      selectedTextStyle: TextStyle(color: Colors.blue),
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
        setState(() {
          _userInfoModel.gender = picker.getSelectedValues().first;
          _userInfoModel.genderId = value.toString();
        });
      }
    );
    picker.show(_scaffoldKey.currentState);
  }

  // 选择城市picker
  showCityPicker() {
    return;
    // DOTO: 做 _cityJson 转 PickerItem
    if (_cityJson == null) { return; }
    var list = <PickerItem>[];
    for (var item in _cityJson) {
//      PickerItem()
    }


    final adapter = PickerDataAdapter(data: [
      PickerItem(value: '男'),
      PickerItem( value: '女'),
    ]);

    Picker picker = Picker(
        adapter: adapter,
        changeToFirst: false,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.blue),
        selectedTextStyle: TextStyle(color: Colors.blue),
        columnPadding: const EdgeInsets.all(8.0),
        onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
//          setState(() {
//            _userInfoModel.gender = picker.getSelectedValues().first;
//            _userInfoModel.genderId = value.toString();
////          gender = "男";
////          print(gender);
//          });
        }
    );
    picker.show(_scaffoldKey.currentState);
  }

  @override
  void initState() {
    // TODO: implement initState

    // 获取本地json
    DefaultAssetBundle.of(context).loadString('static/source/city.json').then((value){
      _cityJson = json.decode(value);
      print(_cityJson);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

//        adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData)),
//  Future<String> loadString = DefaultAssetBundle.of(context).loadString("static/source/city.json");
//  print(loadString);
//  List<dynamic> data;
////  var obj = json.decode(loadString);
//  loadString.then((String value){
//    // 通知框架此对象的内部状态已更改
//    data = json.decode(value);
//  });
//
//  print(data);

    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('我的资料'),
      ),
      body: Container(
        color: Colors.black12,
        child: Stack(
          fit: StackFit.expand, // Stack未定位的子组件大小由fit参数决定，默认值是StackFit.loose，表示子组件自己决定，StackFit.expand表示尽可能的大
          alignment: Alignment.center, // Stack未定位的子组件的默认左上角对齐，通过alignment参数控制，用法如下：
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                SDMMRow(
                  dividerHidden: true,
                  color: Colors.white,
                  showArrow: true,
                  showArrowPadding: EdgeInsets.only(right: 10, left: 10,),
                  onTapDown: (TapDownDetails tap) {
                    print('SDMMRow tap');
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('头像'),
                        Container(
                          padding: EdgeInsets.only(top: 7, bottom: 7),
                          child: Image.asset(
                            'static/img/head.png',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SDMMRow(
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 100,
//                              height: 24,
                              padding: EdgeInsets.only(left: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('真实姓名：'),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ConstrainedBox( // 限制子组件大小
                                constraints: BoxConstraints(
                                    maxHeight: 40,
                                    maxWidth: 200
                                ),
                                child: TextFormField(
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    hintText: '请输入姓名',
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none),),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none),),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10), // 限制内间距
                                  ),
                                  onSaved: (value) {
                                    _userInfoModel.name = value;
                                  },
                                  validator: (String value) {
                                    return value.length > 1 ? null : '姓名最少1个字符';
                                  },
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),

                      SDMMRow(
                        dividerHidden: true,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 100,
//                              height: 24,
                              padding: EdgeInsets.only(left: 15),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('手机号：'),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ConstrainedBox( // 限制子组件大小
                                constraints: BoxConstraints(
                                    maxHeight: 40,
                                    maxWidth: 200
                                ),
                                child: TextFormField(
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    hintText: '请输入手机号',
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none),),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none),),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 10), // 限制内间距
                                  ),
                                  onSaved: (value) {
                                    _userInfoModel.phone = value;
                                  },
                                  validator: (String value) {
                                    return value.length > 1 ? null : '姓名最少1个字符';
                                  },
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      SDMMRow(
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('实名信息：', style: TextStyle(color: Color.fromARGB(255, 190, 13, 102)),),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                SDMMRow(
                  showArrow: true,
                  showArrowPadding: EdgeInsets.only(right: 10, left: 10,),
                  color: Colors.white,
                  onTapDown: (TapDownDetails tap) {
                    showGenderPicker();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 40,
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('性别：'),
                        ),
                      ),
                      Container(
                        child: Text(_userInfoModel.gender ?? '请选择性别'),
                      ),
                    ],
                  ),
                ),

                SDMMRow(
                  dividerHidden: true,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
//                              height: 24,
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('身份证号：'),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ConstrainedBox( // 限制子组件大小
                          constraints: BoxConstraints(
                              maxHeight: 40,
                              maxWidth: 200
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: '请输入身份证号',
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none),),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.none),),
                              contentPadding: const EdgeInsets.symmetric(vertical: 10), // 限制内间距
                            ),
                            onSaved: (value) {
                              _userInfoModel.phone = value;
                            },
                            validator: (String value) {
                              return value.length > 1 ? null : '身份证最少1个字符';
                            },
                          ),
                        ),

                      ),
                    ],
                  ),
                ),

                SDMMRow(
                  showArrow: true,
                  showArrowPadding: EdgeInsets.only(right: 10, left: 10,),
                  color: Colors.white,
                  onTapDown: (TapDownDetails tap) {
                    showPickerArray(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 40,
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('出生日期：'),
                        ),
                      ),
                      Container(
                        child: Text(_userInfoModel.date ?? '请选择出生日期'),
                      ),
                    ],
                  ),
                ),

                SDMMRow(
                  showArrow: true,
                  showArrowPadding: EdgeInsets.only(right: 10, left: 10,),
                  color: Colors.white,
                  onTapDown: (TapDownDetails tap) {
                    showCityPicker();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 40,
                        padding: EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('地址：'),
                        ),
                      ),
                      Container(
                        child: Text(_userInfoModel.address ?? '请选择地址'),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

}
