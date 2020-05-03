import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:remember_prices/data/blocs/brand/brand_bloc.dart';
import 'package:remember_prices/data/blocs/product/product_bloc.dart';
import 'package:remember_prices/data/network/brand/firebase/index.dart';
import 'package:remember_prices/data/repositories/firebase/index.dart';

void initiKiwi() {
  kiwi.Container()
    ..registerInstance(Firestore.instance)
    ..registerFactory((c) => BrandDataSource(c.resolve()))
    ..registerFactory((c) => BrandRepository(c.resolve()))
    ..registerFactory((c) => BrandBloc(c.resolve()))
    ..registerFactory((c) => ProductDataSource(c.resolve()))
    ..registerFactory((c) => ProductRepository(c.resolve(), c.resolve()))
    ..registerFactory((c) => ProductBloc(c.resolve()));

  kiwi.Container().silent = true;
}
