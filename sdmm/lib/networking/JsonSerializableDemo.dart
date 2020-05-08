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
      "image": {
        "url" : "url12345",
        "width": 20.1,
        "height": 21,
      },
      "images": [
        {
          "url" : "url12345",
          "width": 20.1,
          "height": 21,
        },
        {
          "url" : "url12346",
          "width": 20.1,
          "height": 21,
        },
      ]
    };

    var user = new User.fromJson(userMap);
    print("${user.myId}、${user.name}、${user.email}");

    String jsonStr = json.encode(user);
    print('jsonStr =' + jsonStr);
    print('Map = ');
    print(json.decode(jsonStr));
    print(user.date);
    print(user.image.width);
    print(user.image.height);
    print(user.images);
  }

}

// https://www.jianshu.com/p/b307a377c5e8