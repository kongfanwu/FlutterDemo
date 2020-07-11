import 'package:json_annotation/json_annotation.dart';

part 'jishi_model.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class JiShiModel {
  JiShiModel(this.id, this.name);

  int id;
  String name;

  //不同的类使用不同的mixin即可
  factory JiShiModel.fromJson(Map<String, dynamic> json) => _$JiShiModelFromJson(json);
  Map<String, dynamic> toJson() => _$JiShiModelToJson(this);
}