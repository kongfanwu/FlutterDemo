/* JSON Model 相互序列化示例
* */
import 'package:sdmm/networking/user.dart';
import 'dart:convert';

class JsonSerializableDemo {
  JsonSerializableDemo() {
    var userMap = {
      "name": "John Smith",
       "email": "john@example.com",
       "id": "123456",
    };

    var user = new User.fromJson(userMap);
    print("${user.myId}、${user.name}、${user.email}");

    String jsonStr = json.encode(user);
    print('jsonStr =' + jsonStr);
    print('Map = ');
    print(json.decode(jsonStr));
  }

}

// https://www.jianshu.com/p/b307a377c5e8