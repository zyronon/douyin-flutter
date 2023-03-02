// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'woman.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Woman _$EntityFromJson(Map<String, dynamic> json) => Woman(
      json['name'] as String,
      json['country'] as String,
      json['age'] as int,
      json['height'] as int,
      json['weight'] as int,
      json['sex'] as int,
      json['lowPrice'] as int,
      json['highPrice'] as int,
      json['img'] as String,
    );

Map<String, dynamic> _$EntityToJson(Woman instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'sex': instance.sex,
      'lowPrice': instance.lowPrice,
      'highPrice': instance.highPrice,
      'img': instance.img,
    };
