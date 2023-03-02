import 'package:json_annotation/json_annotation.dart';

part 'woman.g.dart';

@JsonSerializable()
class Woman extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'age')
  int age;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'weight')
  int weight;

  @JsonKey(name: 'sex')
  int sex;

  @JsonKey(name: 'lowPrice')
  int lowPrice;

  @JsonKey(name: 'highPrice')
  int highPrice;

  @JsonKey(name: 'img')
  String img;

  Woman(
    this.name,
    this.country,
    this.age,
    this.height,
    this.weight,
    this.sex,
    this.lowPrice,
    this.highPrice,
    this.img,
  );

  factory Woman.fromJson(Map<String, dynamic> srcJson) => _$EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntityToJson(this);
}
