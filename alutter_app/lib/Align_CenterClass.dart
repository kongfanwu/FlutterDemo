import 'package:flutter/material.dart';

// Align和Center控件都是控制子控件位置的控件。

// ignore: camel_case_types
class Align_CenterClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max, // 尽可能大
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 对齐方式
      children: <Widget>[
        Container(
        color: Colors.green,
          width: 200,
          height: 200,
          child: Align(
            alignment: Alignment.bottomRight, // 9个位置，具体看API
            child: Text(
              'kongfanwu',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ),
        Container(
          color: Colors.green,
          width: 200,
          height: 200,
          child: Align(
            // 自定义位置：
            // X轴：最左-1  最右 1
            // Y轴：最上-1  最下 1
            alignment: Alignment(0, 0),
            child: Text(
              'kongfanwu',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ),
        Container(
          color: Colors.lightBlue,
          // widthFactor和heightFactor参数不为null且父组件没有限制大小，此时Align的宽度等于子控件的宽度乘以对应的factor，用法如下：
          child: Align(
            widthFactor: 6,
            heightFactor: 4,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
          ),
        ),
        Container(
          color: Colors.cyan,
          child: Center(
            child: Text('Center 组件继承Align, 让子组件居中'),
          ),
        ),
      ],
    );
  }
}
