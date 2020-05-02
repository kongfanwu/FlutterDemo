import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SDMMMyQRCode extends StatefulWidget {
  SDMMMyQRCode({this.navBarTitle});

  final String navBarTitle;

  @override
  _SDMMMyQRCodeState createState() => _SDMMMyQRCodeState();
}

class _SDMMMyQRCodeState extends State<SDMMMyQRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.navBarTitle),
      ),
      body: Stack(
        fit: StackFit.expand, // Stack未定位的子组件大小由fit参数决定，默认值是StackFit.loose，表示子组件自己决定，StackFit.expand表示尽可能的大
        alignment: Alignment.center, // Stack未定位的子组件的默认左上角对齐，通过alignment参数控制，用法如下：
        children: <Widget>[
          Container(
//            color: Colors.red,
            child: Image.asset(
                'static/img/qrcode_bg.png',
                fit: BoxFit.cover,
              ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 40,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Color.fromARGB(255, 252, 228, 190), // 圆角设置颜色后，Container 的color 就不要再次设置颜色了。会报错
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 40,
            height: 264 * 0.5,
//            width: 206 * 0.5,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 206 * 0.5,
//                    color: Colors.red,
                    child: Image.asset(
                      'static/img/qrcode_jixiangwu.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 40 + 264 * 0.5,
            height: 20,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 206 * 0.5,
//                    color: Colors.orange,
                    child: Text('您的邀请码是'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 40 + 264 * 0.5 + 20,
            height: 84,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    padding: EdgeInsets.only(bottom: 5),
                    width: 200,
                    height: 44,
//                    color: Colors.blue,
                    decoration: BoxDecoration( // 外部不允许在设置颜色了。可内部设置
//                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage('static/img/qrcode_btnbg.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: FlatButton(
                      child: Text(
                        'A9b2',
                         style: TextStyle(
                           fontSize: 25,
                           color: Colors.white,
                         ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
