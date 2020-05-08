// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weatherModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return WeatherModel(
    json['date'] as String,
    json['high'] as String,
    json['low'] as String,
    json['type'] as String,
    json['fengxiang'] as String,
  );
}

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'high': instance.high,
      'low': instance.low,
      'type': instance.type,
      'fengxiang': instance.fengxiang,
    };
