library product;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:remember_prices/data/models/product/index.dart';
import 'package:remember_prices/data/shared/serializers/index.dart';

part 'product.g.dart';

abstract class Product implements Built<Product, ProductBuilder> {
  String get documentID;
  DataProduct get data;
  Product._();

  factory Product([updates(ProductBuilder b)]) = _$Product;

  String toJson() {
    return json.encode(serializers.serializeWith(Product.serializer, this));
  }

  static Product fromJson(String jsonString) {
    return serializers.deserializeWith(
        Product.serializer, json.decode(jsonString));
  }

  static Serializer<Product> get serializer => _$productSerializer;
}
