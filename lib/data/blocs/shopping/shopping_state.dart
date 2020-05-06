library shopping_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:remember_prices/data/models/shopping/index.dart';

part 'shopping_state.g.dart';

abstract class GetAllShoppingsFromProductIdState
    implements
        Built<GetAllShoppingsFromProductIdState,
            GetAllShoppingsFromProductIdStateBuilder> {
  bool get isLoading;
  BuiltList<Shopping> get shoppings;
  String get error;

  bool get isInitial => !isLoading && shoppings.isEmpty && error == '';
  bool get isSuccessful => !isLoading && shoppings.isNotEmpty && error == '';

  GetAllShoppingsFromProductIdState._();

  factory GetAllShoppingsFromProductIdState(
          [updates(GetAllShoppingsFromProductIdStateBuilder b)]) =
      _$GetAllShoppingsFromProductIdState;

  factory GetAllShoppingsFromProductIdState.initial() {
    return GetAllShoppingsFromProductIdState((b) => b
      ..isLoading = true
      ..shoppings.replace(BuiltList<Shopping>())
      ..error = '');
  }
  factory GetAllShoppingsFromProductIdState.loading() {
    return GetAllShoppingsFromProductIdState((b) => b
      ..isLoading = true
      ..shoppings.replace(BuiltList<Shopping>())
      ..error = '');
  }
  factory GetAllShoppingsFromProductIdState.failure(String error) {
    return GetAllShoppingsFromProductIdState((b) => b
      ..isLoading = false
      ..shoppings.replace(BuiltList<Shopping>())
      ..error = '');
  }
  factory GetAllShoppingsFromProductIdState.success(
      BuiltList<Shopping> resultList) {
    return GetAllShoppingsFromProductIdState((b) => b
      ..isLoading = false
      ..shoppings.replace(resultList)
      ..error = '');
  }
}
