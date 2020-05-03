import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:remember_prices/data/blocs/product/product_event.dart';
import 'package:remember_prices/data/blocs/product/product_state.dart';
import 'package:remember_prices/data/repositories/firebase/index.dart';

import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;

  ProductBloc(this._repository) : super();

  @override
  ProductState get initialState => ProductState.initial();

  void onProductInitiated() => add(ProductInitiated());

  void onInsertProduct(String name) =>
      add(ProductInsert((b) => b..name = name));

  void onDeleteProduct(String documentID) =>
      add(ProductDelete((b) => b..documentID = documentID));

  void onEditProduct(String documentID, String name) => add(ProductEdit((b) => b
    ..documentID = documentID
    ..name = name));

  void onGetById(String documentID) =>
      add(ProductGetById((b) => b..documentID = documentID));

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    yield ProductState.loading();

    if (event is ProductInitiated) yield* mapProductInitiated(event);
    if (event is ProductInsert) yield* mapProductInsert(event);
    if (event is ProductDelete) yield* mapProductProductDelete(event);
    if (event is ProductEdit) yield* mapProductProductEdit(event);
    if (event is ProductGetById) yield* mapProductProductGetById(event);
  }

  Stream<ProductState> mapProductInitiated(ProductInitiated event) async* {
    try {
      final searchResult = await _repository.getProducts();
      yield ProductState.success(searchResult);
    } on Exception catch (e) {
      yield ProductState.failure(e.toString());
    }
  }

  Stream<ProductState> mapProductInsert(ProductInsert event) async* {
    try {
      await _repository.insertProduct(event.name);
      onProductInitiated();
    } on Exception catch (e) {
      yield ProductState.failure(e.toString());
    }
  }

  Stream<ProductState> mapProductProductDelete(ProductDelete event) async* {
    try {
      await _repository.deleteProduct(event.documentID);
      onProductInitiated();
    } on Exception catch (e) {
      yield ProductState.failure(e.toString());
    }
  }

  Stream<ProductState> mapProductProductEdit(ProductEdit event) async* {
    try {
      await _repository.editProduct(event.documentID, event.name);
      onProductInitiated();
    } on Exception catch (e) {
      yield ProductState.failure(e.toString());
    }
  }

  Stream<ProductState> mapProductProductGetById(ProductGetById event) async* {
    try {
      final result = await _repository.getProductByID(event.documentID);
      yield ProductState.successGetById(result);
    } on Exception catch (e) {
      yield ProductState.failure(e.toString());
    }
  }
}
