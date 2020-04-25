import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogClass extends StatelessWidget {

  // 系统样式1
  void _onPressedAlertDialog(BuildContext context) {
    var result = showDialog(
      context: context,
//      barrierDismissible: false, // 点击空白处是否退出对话框，默认 true
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.lightBlueAccent,
          elevation: 24,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text('提示'),
          content: Text('确认删除吗？AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背景颜色、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背、阴影值，设置是形状：AlertDialog的属性相对比较丰富，可以设置title样式、content样式、背'),
          actions: <Widget>[
            FlatButton(child: Text('取消'), onPressed: (){
              Navigator.of(context).pop('cancel');
            },),
            FlatButton(child: Text('确定'), onPressed: (){
              Navigator.of(context).pop('ok');
            },),
          ],
        );
      },
    );

    print('$result');
  }

  // 系统样式2
  void _onPressedCupertionAlertDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('提示'),
            content: Text('确认删除吗？'),
            actions: <Widget>[
              FlatButton(child: Text('取消'), onPressed: (){
                Navigator.of(context).pop('cancel');
              },),
              FlatButton(child: Text('确定'), onPressed: (){
                Navigator.of(context).pop('ok');
              },),
            ],
          );
        },
    );
  }

  // 自定义
  void _onPressedSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
//      barrierDismissible: false, // 点击空白处是否退出对话框，默认 true
      builder: (context) {
        return SimpleDialog(
          title: Text('提示'),
          children: <Widget>[
            Container(
              height: 80,
              alignment: Alignment.center,

              child: Text('确认删除吗？'),
            ),
            Divider(height: 1,),
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop('cancel');
              },
            ),
            Divider(height: 1,),
            FlatButton(
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop('ok');
              },
            ),
          ],
        );
      },
    );
  }

  // 高度自定义
  void _onPressedDialog(BuildContext context) {
    showDialog(
      context: context,
//      barrierDismissible: false, // 点击空白处是否退出对话框，默认 true
      builder: (context) {
        return Dialog(
          child: Container(
            color: Colors.red,
            width: 200,
            height: 200,
            child: Column(
              children: <Widget>[
                Text('123'),
                FlatButton(
                  child: Text('确认'),
                  onPressed: () {
                    Navigator.of(context).pop('ok');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('AlertDialog-material风格'),
          onPressed: () {
            _onPressedAlertDialog(context);
          },
        ),
        RaisedButton(
          child: Text('CupertinoAlertDialog-Cupertion(iOS)风格'),
          onPressed: () {
            _onPressedCupertionAlertDialog(context);
          },
        ),
        RaisedButton(
          child: Text('SimpleDialog-自定义'),
          onPressed: () {
            _onPressedSimpleDialog(context);
          },
        ),
        RaisedButton(
          child: Text('Dialog-高度自定义， 终极大招'),
          onPressed: () {
            _onPressedDialog(context);
          },
        ),
      ],
    );
  }
}
