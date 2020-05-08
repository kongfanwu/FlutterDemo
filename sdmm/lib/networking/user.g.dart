// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['email'] as String,
    json['id'] as String,
    json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
    (json['images'] as List)
        ?.map(
            (e) => e == null ? null : Image.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..date =
      json['date'] == null ? null : DateTime.parse(json['date'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'images': instance.images,
      'date': instance.date?.toIso8601String(),
      'id': instance.myId,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['url'] as String,
    (json['width'] as num)?.toDouble(),
    json['height'] as int,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
