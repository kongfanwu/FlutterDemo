import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

/*
一次性生成命令：flutter packages pub run build_runner build
持续生成命令：flutter packages pub run build_runner watch
* * */

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User{
  User(this.name, this.email, this.myId, this.image, this.images);

  String name;
  String email;
  Image image;

  // images 数组包含 Image 对象
  List <Image> images;

  // json 无此对象，默认 null。 反序列化也是null
  DateTime date;

  //  服务端key与model key 相互转换。 id 服务端key
  @JsonKey(name: 'id')
  final String myId;

  //不同的类使用不同的mixin即可
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}


// user.g.dart 将在我们运行生成命令后自动生成
//part 'image.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class Image {
  Image(this.url, this.width, this.height);
  String url;
  double width;
  int height;
  //不同的类使用不同的mixin即可
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}