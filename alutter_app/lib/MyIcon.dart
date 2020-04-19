import 'package:flutter/material.dart';

class MyIcon {
  static const IconData huawei = const IconData(
    0xe501, // 从icont font 下载下来的demo_index.html 文件 icon 后对应的后4位，前边加上0x
    fontFamily: 'myGoodIcon', // pubspec.yaml 文件 family：的名字
    matchTextDirection: true, // 是否和文字方向一样
  );
   static const IconData oppo = const IconData(
    0xe60d, // 从icont font 下载下来的demo_index.html 文件 icon 后对应的后4位，前边加上0x
    fontFamily: 'myGoodIcon', // pubspec.yaml 文件 family：的名字
    matchTextDirection: true, // 是否和文字方向一样
  );
   static const IconData xiaomi = const IconData(
    0xe60c, // 从icont font 下载下来的demo_index.html 文件 icon 后对应的后4位，前边加上0x
    fontFamily: 'myGoodIcon', // pubspec.yaml 文件 family：的名字
    matchTextDirection: true, // 是否和文字方向一样
  );
}