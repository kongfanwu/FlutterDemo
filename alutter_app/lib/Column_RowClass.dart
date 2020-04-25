import 'package:flutter/material.dart';
/*
在Row和Column中有一个非常重要的概念：MainAxisAlignment（主轴）和CrossAxisAlignment（交叉轴），
简单来说，MainAxisAlignment（主轴）就是与当前控件方向一致的轴，而CrossAxisAlignment（交叉轴）
就是与当前控件方向垂直的轴，比如Row的主轴是水平方向，交叉轴是垂直方向，而Column的主轴是垂直方向，交叉轴是水平方向。
Row和Column是多子控件的容器类控件，Row控件水平布局，Column控件垂直布局。
*/
class Column_RowClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max, // 主轴尺寸由mainAxisSize属性控制，仅有min和max两种方式，默认是max方法。min表示尽可能小，而max表示尽可能大，
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
        color: Colors.black12,
          child: Row(
            textDirection: TextDirection.rtl, // 控制水平方向布局，
            mainAxisAlignment: MainAxisAlignment.start, // 在 textDirection 方向基础上，控制对齐方式。 例如：textDirection水平方向从右到左，那mainAxisAlignment 的 start 就是右边
            children: <Widget>[
              Container(
                height: 50,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 50,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 50,
                width: 100,
                color: Colors.blue,
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center, // stretch 表示使子控件填满父组件交叉轴。注意：要求父组件要有高度限制。否责报无限高错误
            children: <Widget>[
              Container(
                height: 50,
                width: 100,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.green,
              ),
              Container(
                height: 150,
                width: 100,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
