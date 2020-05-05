library data_shopping;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:remember_prices/data/models/brand/index.dart';
import 'package:remember_prices/data/shared/serializers/index.dart';

part 'data_shopping.g.dart';

abstract class DataShopping
    implements Built<DataShopping, DataShoppingBuilder> {
  String get brandId;
  double get price;
  String get date;
  String get productId;

  @nullable
  Brand get brand;

  @nullable
  bool get promotion;

  DataShopping._();

  factory DataShopping([updates(DataShoppingBuilder b)]) = _$DataShopping;

  String toJson() {
    return json
        .encode(serializers.serializeWith(DataShopping.serializer, this));
  }

  static DataShopping fromJson(String jsonString) {
    return serializers.deserializeWith(
        DataShopping.serializer, json.decode(jsonString));
  }

  static Serializer<DataShopping> get serializer => _$dataShoppingSerializer;
}
