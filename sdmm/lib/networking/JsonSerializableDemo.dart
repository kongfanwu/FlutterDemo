
import 'package:sdmm/networking/user.dart';
import 'dart:convert';

class JsonSerializableDemo {
  String name;
  JsonSerializableDemo(this.name) {
    print("11111111111");

    var userMap = {
      "name": "John Smith",
       "email": "john@example.com",
      "registration_date_millis": "haha",
    };


    print(userMap.runtimeType);

    var user = new User.fromJson(userMap);
    print(user.name + '----' + user.email);
    print(user.registrationDateMillis);
  }

}