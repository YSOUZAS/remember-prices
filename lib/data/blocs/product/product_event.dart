library product_event;

import 'package:built_value/built_value.dart';

part 'product_event.g.dart';

abstract class ProductEvent {}

abstract class ProductInitiated extends ProductEvent
    implements Built<ProductInitiated, ProductInitiatedBuilder> {
  ProductInitiated._();

  factory ProductInitiated([updates(ProductInitiatedBuilder b)]) =
      _$ProductInitiated;
}

abstract class ProductInsert extends ProductEvent
    implements Built<ProductInsert, ProductInsertBuilder> {
  @nullable
  String get name;

  ProductInsert._();

  factory ProductInsert([updates(ProductInsertBuilder b)]) = _$ProductInsert;
}

abstract class ProductDelete extends ProductEvent
    implements Built<ProductDelete, ProductDeleteBuilder> {
  String get documentID;
  ProductDelete._();

  factory ProductDelete([updates(ProductDeleteBuilder b)]) = _$ProductDelete;
}

abstract class ProductEdit extends ProductEvent
    implements Built<ProductEdit, ProductEditBuilder> {
  String get documentId;
  Map<String, dynamic> get data;
  ProductEdit._();

  factory ProductEdit([updates(ProductEditBuilder b)]) = _$ProductEdit;
}

abstract class ProductGetById extends ProductEvent
    implements Built<ProductGetById, ProductGetByIdBuilder> {
  @nullable
  String get documentID;

  ProductGetById._();

  factory ProductGetById([updates(ProductGetByIdBuilder b)]) = _$ProductGetById;
}
