// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    json['id'] as int,
    json['manage_type'] as int,
    json['name'] as String,
    json['phone'] as String,
    json['password'] as String,
    json['token'] as String,
    (json['join_code'] as List)
        ?.map((e) =>
            e == null ? null : JoinModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'manage_type': instance.manage_type,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'token': instance.token,
      'join_code': instance.join_code,
    };

JoinModel _$JoinModelFromJson(Map<String, dynamic> json) {
  return JoinModel(
    json['code'] as String,
    json['name'] as String,
    json['join_logo'] as String,
    json['fram_id'] as String,
    json['function_id'] as int,
    json['fram_name_id'] as int,
    json['store_code'] as String,
    json['framework_function_name'] as String,
    json['framework_function_main_role'] as int,
  )..fram_id_name = json['fram_id_name'] as String;
}

Map<String, dynamic> _$JoinModelToJson(JoinModel instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'join_logo': instance.join_logo,
      'fram_id': instance.fram_id,
      'function_id': instance.function_id,
      'fram_name_id': instance.fram_name_id,
      'store_code': instance.store_code,
      'fram_id_name': instance.fram_id_name,
      'framework_function_name': instance.framework_function_name,
      'framework_function_main_role': instance.framework_function_main_role,
    };
