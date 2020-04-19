import 'package:flutter/material.dart';

class TextClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextClassState();
  }
}

class TextClassState extends State<TextClass> {
  static const styles = TextStyle(
    //color: Colors.green,
    color: const Color(0xffff0000),// 16进制颜色 0x 16进制前缀 ff 透明度 后6位是颜色 RGB
    fontSize: 20,
    fontFamily: 'yahei',
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dashed,
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text('样式测试',
          style: styles,
        ),
        Text(' textAlign: TextAlign.right,), textAlign: TextAlign.right,), textAlign: TextAlign.right,),',
          textAlign: TextAlign.right, // 对齐方式
          maxLines: 2,  // 最大行
          overflow: TextOverflow.ellipsis, // 截取方式
          textScaleFactor: 2.1, // 放大倍数
        ),
        Text.rich(TextSpan(
            children: [
              TextSpan(text: '主页'),
              TextSpan(text: 'https//www.baidu.com',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                  )
              ),
            ]
        ))
      ],
    );
  }

}