library data_brand;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:remember_prices/data/shared/serializers/index.dart';

part 'data_brand.g.dart';

abstract class DataBrand implements Built<DataBrand, DataBrandBuilder> {
  String get name;
  String get imageUrl;
  DataBrand._();

  factory DataBrand([updates(DataBrandBuilder b)]) = _$DataBrand;

  String toJson() {
    return json.encode(serializers.serializeWith(DataBrand.serializer, this));
  }

  static DataBrand fromJson(String jsonString) {
    return serializers.deserializeWith(
        DataBrand.serializer, json.decode(jsonString));
  }

  static Serializer<DataBrand> get serializer => _$dataBrandSerializer;
}
