import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:remember_prices/data/blocs/brand/brand_event.dart';
import 'package:remember_prices/data/repositories/firebase/index.dart';

import 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository _repository;

  BrandBloc(this._repository) : super();

  @override
  BrandState get initialState => BrandState.initial();

  void onBrandInitiated() => add(BrandInitiated());

  void onInsertBrand(String name) => add(BrandInsert((b) => b..name = name));

  void onDeleteBrand(String documentID) =>
      add(BrandDelete((b) => b..documentID = documentID));

  void onEditBrand(String documentID, String name) => add(BrandEdit((b) => b
    ..documentID = documentID
    ..name = name));

  @override
  Stream<BrandState> mapEventToState(BrandEvent event) async* {
    yield BrandState.loading();

    if (event is BrandInitiated) yield* mapBrandInitiated(event);
    if (event is BrandInsert) yield* mapBrandInsert(event);
    if (event is BrandDelete) yield* mapBrandBrandDelete(event);
    if (event is BrandEdit) yield* mapBrandBrandEdit(event);
  }

  Stream<BrandState> mapBrandInitiated(BrandInitiated event) async* {
    try {
      final searchResult = await _repository.getBrands();
      yield BrandState.success(searchResult);
    } on Exception catch (e) {
      yield BrandState.failure(e.toString());
    }
  }

  Stream<BrandState> mapBrandInsert(BrandInsert event) async* {
    try {
      await _repository.insertBrand(event.name);
      onBrandInitiated();
    } on Exception catch (e) {
      yield BrandState.failure(e.toString());
    }
  }

  Stream<BrandState> mapBrandBrandDelete(BrandDelete event) async* {
    try {
      await _repository.deleteBrand(event.documentID);
      onBrandInitiated();
    } on Exception catch (e) {
      yield BrandState.failure(e.toString());
    }
  }

  Stream<BrandState> mapBrandBrandEdit(BrandEdit event) async* {
    try {
      await _repository.editBrand(event.documentID, event.name);
      onBrandInitiated();
    } on Exception catch (e) {
      yield BrandState.failure(e.toString());
    }
  }
}
