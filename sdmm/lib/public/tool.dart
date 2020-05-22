import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class Tool {
  // md5 加密
  static String xmhMD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}