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
  )
    ..serviceType =
        _$enumDecodeNullable(_$ServiceTypeEnumMap, json['serviceType'])
    ..cardType = _$enumDecodeNullable(_$CardTypeEnumMap, json['cardType'])
    ..buyCount = json['buyCount'] as int;
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
      'serviceType': _$ServiceTypeEnumMap[instance.serviceType],
      'cardType': _$CardTypeEnumMap[instance.cardType],
      'buyCount': instance.buyCount,
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
