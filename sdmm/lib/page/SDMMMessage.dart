import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sdmm/networking/DioManager.dart';
import 'dart:math';

class SDMMMessage extends StatefulWidget {
  @override
  _SDMMMessageState createState() => _SDMMMessageState();
}

class _SDMMMessageState extends State<SDMMMessage> {

  /*
    account = 18600003333;
    cnmtp = 1;
    "device_token" = "";
    "join_code" = "";
    nonce = 159006087270427635;
    password = 21218cca77804d2ba1922c33e0151105;
    sign = ebe7aa6620d645bce36d0ce04b469c71;
    timestamp = 1590060872;
  * */

  /*
  原字典
    account = 18600003333;
    cnmtp = 1;
    "device_token" = "";
    "join_code" = "";
    nonce = 15900643521114054;
    password = 21218cca77804d2ba1922c33e0151105;
    timestamp = 1590064352;
    url = "http://192.168.1.200/index.php/v5.login/index";

    // 1 key 字母大小排序
    account,
    cnmtp,
    device_token,
    join_code,
    nonce,
    password,
    timestamp,
    url

    // 2 移除value 为空字符串的键值对
    account,
    cnmtp,
    nonce,
    password,
    timestamp,
    url

    // 3 键值对用 = 链接，放到数组里
    account=18600003333,
    cnmtp=1,
    nonce=15900643521114054,
    password=21218cca77804d2ba1922c33e0151105,
    timestamp=1590064352,
    url=http://192.168.1.200/index.php/v5.login/index

    // 4 数组里的字符串 用&链接成大字符串
    account=18600003333&cnmtp=1&nonce=15900643521114054&password=21218cca77804d2ba1922c33e0151105&timestamp=1590064352&url=http://192.168.1.200/index.php/v5.login/index

    // 5 appKey(U7doak7fl4da45d) 与第4步拼接 得到sig1
    U7doak7fl4da45daccount=18600003333&cnmtp=1&nonce=15900643521114054&password=21218cca77804d2ba1922c33e0151105&timestamp=1590064352&url=http://192.168.1.200/index.php/v5.login/index

    // 6 sig1 2次MD5  得到 sig
    9dde13e7cb92f504c511ae93495eb4ca
  * */

  String _getSigWithParams(Map<String, dynamic> params) {
    // 1
    List keys = params.keys.toList();
    keys.sort();
    print(keys);
  }

  void _getIPAddress() {
    final url = 'http://pc.test.api.shendengzhineng.com/index.php/v5.login/index';
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final timestampHaoMiao = timestamp / 1000;

    Map<String, dynamic> params = {};
    params['account'] = '18600004444';
    params['password'] = '21218cca77804d2ba1922c33e0151105';
    params['device_token'] = '';

    //    params['token'] = ''; // 登录不需要，其他接口需要
    params['cnmtp'] = '1';
    params['join_code'] = '';

    params['timestamp'] = timestampHaoMiao.toInt().toString();
    params['nonce'] = '$timestamp${Random().nextInt(100000)}';
    params['url'] = url; // sign完 移除掉
    params['sign'] = _getSigWithParams(params);





//    DioManager.getInstance().post(url, params, (data) {
//      print(data);
//    }, (error) {
//      print(error);
//    });
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        child: RaisedButton(
          onPressed: () {
            _getIPAddress();

          },

          child: new Text('Get IP address'),
        ),
      ),
    );
  }
}
