import 'package:json_annotation/json_annotation.dart';
// user.g.dart 将在我们运行生成命令后自动生成
part 'weatherModel.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class WeatherModel {
  WeatherModel(this.date, this.high, this.low, this.type, this.fengxiang);

  String date;
  String high;
  String low;
  String type;
  String fengxiang;
  //不同的类使用不同的mixin即可
  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}