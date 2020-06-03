// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsModel _$GoodsModelFromJson(Map<String, dynamic> json) {
  return GoodsModel(
    json['id'] as int,
    json['name'] as String,
    json['pro_code'] as String,
    json['num'] as int,
    json['shichang'],
    json['is_new'] as int,
    json['price'] as String,
    json['max_num'] as int,
    json['limit'] as int,
    json['goods_code'] as String,
  );
}

Map<String, dynamic> _$GoodsModelToJson(GoodsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pro_code': instance.pro_code,
      'num': instance.num,
      'shichang': instance.shichang,
      'is_new': instance.is_new,
      'price': instance.price,
      'max_num': instance.max_num,
      'limit': instance.limit,
      'goods_code': instance.goods_code,
    };
