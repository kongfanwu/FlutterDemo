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
  )
    ..serviceType =
        _$enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType'])
    ..cardType = _$enumDecodeNullable(_$CardTypeEnumMap, json['cardType']);
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
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType],
      'cardType': _$CardTypeEnumMap[instance.cardType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ServiceTypeEnumMap = {
  ServiceType.chuFang: 'chuFang',
  ServiceType.tiKa: 'tiKa',
  ServiceType.project: 'project',
  ServiceType.goods: 'goods',
};

const _$CardTypeEnumMap = {
  CardType.stored: 'stored',
  CardType.num: 'num',
  CardType.time: 'time',
};
