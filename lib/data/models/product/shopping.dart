library shopping;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:remember_prices/data/models/brand/index.dart';
import 'package:remember_prices/data/shared/serializers/index.dart';

part 'shopping.g.dart';

abstract class Shopping implements Built<Shopping, ShoppingBuilder> {
  @nullable
  String get brandId;
  @nullable
  double get price;
  @nullable
  String get date;

  @nullable
  Brand get brand;

  @nullable
  bool get promotion;

  Shopping._();

  factory Shopping([updates(ShoppingBuilder b)]) = _$Shopping;

  String toJson() {
    return json.encode(serializers.serializeWith(Shopping.serializer, this));
  }

  static Shopping fromJson(String jsonString) {
    return serializers.deserializeWith(
        Shopping.serializer, json.decode(jsonString));
  }

  static Serializer<Shopping> get serializer => _$shoppingSerializer;
}
