library data_product;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:remember_prices/data/shared/serializers/index.dart';

part 'data_product.g.dart';

abstract class DataProduct implements Built<DataProduct, DataProductBuilder> {
  String get name;
  String get imageUrl;
  String get barcode;

  DataProduct._();

  factory DataProduct([updates(DataProductBuilder b)]) = _$DataProduct;

  String toJson() {
    return json.encode(serializers.serializeWith(DataProduct.serializer, this));
  }

  static DataProduct fromJson(String jsonString) {
    return serializers.deserializeWith(
        DataProduct.serializer, json.decode(jsonString));
  }

  static Serializer<DataProduct> get serializer => _$dataProductSerializer;
}
