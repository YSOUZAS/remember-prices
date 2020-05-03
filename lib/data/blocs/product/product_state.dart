library product_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:remember_prices/data/models/product/index.dart';

part 'product_state.g.dart';

abstract class ProductState
    implements Built<ProductState, ProductStateBuilder> {
  bool get isLoading;
  BuiltList<Product> get products;
  @nullable
  Product get product;
  String get error;

  bool get isInitial => !isLoading && products.isEmpty && error == '';
  bool get isSuccessful =>
      !isLoading && (products.isNotEmpty || product != null) && error == '';

  ProductState._();

  factory ProductState([updates(ProductStateBuilder b)]) = _$ProductState;

  factory ProductState.initial() {
    return ProductState((b) => b
      ..isLoading = true
      ..product = null
      ..products.replace(BuiltList<Product>())
      ..error = '');
  }
  factory ProductState.loading() {
    return ProductState((b) => b
      ..isLoading = true
      ..product = null
      ..products.replace(BuiltList<Product>())
      ..error = '');
  }
  factory ProductState.failure(String error) {
    return ProductState((b) => b
      ..isLoading = false
      ..product = null
      ..products.replace(BuiltList<Product>())
      ..error = '');
  }
  factory ProductState.success(BuiltList<Product> resultList) {
    return ProductState((b) => b
      ..isLoading = false
      ..product = null
      ..products.replace(resultList)
      ..error = '');
  }
  factory ProductState.successGetById(Product result) {
    return ProductState((b) => b
      ..isLoading = false
      ..product.replace(result)
      ..error = '');
  }
  factory ProductState.inserted(BuiltList<Product> resultList) {
    return ProductState((b) => b
      ..isLoading = false
      ..product = null
      ..products.replace(resultList)
      ..error = '');
  }
}
