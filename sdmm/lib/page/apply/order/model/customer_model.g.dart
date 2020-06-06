// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return CustomerModel(
    json['user_id'] as int,
    json['grade'] as int,
    json['jis'] as String,
    json['store_code'] as String,
    json['account'] as String,
    json['user_name'] as String,
    json['mobile'] as String,
    json['insert_time'] as String,
    json['user_headimgurl'] as String,
    json['store_name'] as String,
    json['grade_name'] as String,
  );
}

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'grade': instance.grade,
      'jis': instance.jis,
      'store_code': instance.store_code,
      'account': instance.account,
      'user_name': instance.user_name,
      'mobile': instance.mobile,
      'insert_time': instance.insert_time,
      'user_headimgurl': instance.user_headimgurl,
      'store_name': instance.store_name,
      'grade_name': instance.grade_name,
    };
