import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Stack组件可以将子组件叠加显示，根据子组件的顺利依次向上叠加，用法如下：

class StackClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(
            fit: StackFit.loose, // Stack未定位的子组件大小由fit参数决定，默认值是StackFit.loose，表示子组件自己决定，StackFit.expand表示尽可能的大
            alignment: Alignment.center, // Stack未定位的子组件的默认左上角对齐，通过alignment参数控制，用法如下：
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 170,
                height: 170,
                color: Colors.green,
              ),
              Container(
                width: 140,
                height: 140,
                color: Colors.yellow,
              ),
            ],
          ),
          SizedBox(height: 10,),
          Stack(
            alignment: Alignment.center, // Stack未定位的子组件的默认左上角对齐，通过alignment参数控制，用法如下：
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              // Positioned包裹的子组件就是定位的子组件
              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                top: 20,
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Stack(
            overflow: Overflow.visible, // 如果子组件超过Stack边界由overflow控制，默认是裁剪，下面设置总是显示的用法：
            alignment: Alignment.center, // Stack未定位的子组件的默认左上角对齐，通过alignment参数控制，用法如下：
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              // Positioned包裹的子组件就是定位的子组件
              Positioned(
                left: 100,
                top: 100,
                height: 150,
                width: 150,
                child: Container(
                  color: Colors.green,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
