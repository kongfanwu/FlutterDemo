// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) {
  return CardModel(
    json['id'] as int,
    json['name'] as String,
    json['money'] as String,
    json['stored_code'] as String,
    json['card_num_code'] as String,
    json['card_time_code'] as String,
    json['end_time'] as String,
    json['price'] as String,
    json['num'] as int,
    (json['goods_list'] as List)
        ?.map((e) =>
            e == null ? null : GoodsModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['pro_list'] as List)
        ?.map((e) =>
            e == null ? null : GoodsModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'money': instance.money,
      'stored_code': instance.stored_code,
      'card_num_code': instance.card_num_code,
      'card_time_code': instance.card_time_code,
      'end_time': instance.end_time,
      'price': instance.price,
      'num': instance.num,
      'goods_list': instance.goods_list,
      'pro_list': instance.pro_list,
    };
