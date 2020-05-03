library brand_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:remember_prices/data/models/brand/index.dart';

part 'brand_state.g.dart';

abstract class BrandState implements Built<BrandState, BrandStateBuilder> {
  bool get isLoading;
  BuiltList<Brand> get brands;
  String get error;

  bool get isInitial => !isLoading && brands.isEmpty && error == '';
  bool get isSuccessful => !isLoading && brands.isNotEmpty && error == '';

  BrandState._();

  factory BrandState([updates(BrandStateBuilder b)]) = _$BrandState;

  factory BrandState.initial() {
    return BrandState((b) => b
      ..isLoading = true
      ..brands.replace(BuiltList<Brand>())
      ..error = '');
  }
  factory BrandState.loading() {
    return BrandState((b) => b
      ..isLoading = true
      ..brands.replace(BuiltList<Brand>())
      ..error = '');
  }

  factory BrandState.failure(String error) {
    return BrandState((b) => b
      ..isLoading = false
      ..brands.replace(BuiltList<Brand>())
      ..error = '');
  }

  factory BrandState.success(BuiltList<Brand> resultList) {
    return BrandState((b) => b
      ..isLoading = false
      ..brands.replace(resultList)
      ..error = '');
  }
  factory BrandState.inserted(BuiltList<Brand> resultList) {
    return BrandState((b) => b
      ..isLoading = false
      ..brands.replace(resultList)
      ..error = '');
  }
}
