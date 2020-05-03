library brand;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:remember_prices/data/models/brand/index.dart';
import 'package:remember_prices/data/shared/serializers/index.dart';

part 'brand.g.dart';

abstract class Brand implements Built<Brand, BrandBuilder> {
  String get documentID;
  DataBrand get data;
  Brand._();

  factory Brand([updates(BrandBuilder b)]) = _$Brand;

  String toJson() {
    return json.encode(serializers.serializeWith(Brand.serializer, this));
  }

  static Brand fromJson(String jsonString) {
    return serializers.deserializeWith(
        Brand.serializer, json.decode(jsonString));
  }

  static Serializer<Brand> get serializer => _$brandSerializer;
}
