import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'customer_model.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class CustomerModel {
  CustomerModel(this.user_id, this.grade, this.jis, this.store_code, this.account, this.user_name, this.mobile, this.insert_time, this.user_headimgurl, this.store_name, this.grade_name);

  int user_id;
  int grade;
  String jis;
  String store_code;
  String account;
  String user_name;
  String mobile;
  String insert_time;
  String user_headimgurl;
  String store_name;
  String grade_name;

  //不同的类使用不同的mixin即可
  factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerModelToJson(this);

}
