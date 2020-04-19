
import 'package:flutter/material.dart';
import 'MyIcon.dart';

class ImageClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ImageClassState();
  }

}


class ImageClassState extends State<ImageClass> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        // 每个本地图片，需要在 pubspec.yaml 文件 assets 里配置
        Image.asset('static/img/git.jpg', // 本地图片路径
          fit: BoxFit.cover, // 填充模式
        ),
        Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587310974576&di=ae3c2ca9f5ffd3762a1df2c1280b6859&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F21%2F09%2F01200000026352136359091694357.jpg',
          width: 300,
          height: 200,
          color: Colors.pink,// 混合颜色
          colorBlendMode: BlendMode.darken, // 颜色混合模式
        ),
        Icon(Icons.access_time
        ),
        // 第三方字体库使用步骤。 1 下载字体库 2 将字体库 ttf文件引入项目 3 pubspec.yaml 自定义字体 4 定义字体类MyIcon
        Icon(MyIcon.huawei),
        Icon(MyIcon.oppo, color: Colors.red,),
        Icon(MyIcon.xiaomi),

      ],
    );
  }

}