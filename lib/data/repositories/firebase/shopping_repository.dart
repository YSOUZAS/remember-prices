import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remember_prices/data/models/shopping/index.dart';
import 'package:remember_prices/data/network/shopping/firebase/index.dart';
import 'package:remember_prices/data/repositories/firebase/brand_repository.dart';
import 'package:remember_prices/data/repositories/helpers/generic_converter.dart';

class ShoppingRepository {
  final ShoppingDataSource _shoppingDataSource;
  final BrandRepository _brandRepository;

  ShoppingRepository(this._shoppingDataSource, this._brandRepository);

  Future<BuiltList<Shopping>> getShoppings() async {
    final result = await _shoppingDataSource.getShoppings();
    BuiltList<Shopping> shoppings = new BuiltList<Shopping>();
    if (result.documents.isNotEmpty) {
      for (DocumentSnapshot document in result.documents) {
        var mapShopping = GenericConverter.toMap(document);
        var shopping = Shopping.fromJson(mapShopping);
        shoppings = (shoppings.toBuilder()..add(shopping)).build();
      }
    }
    return shoppings;
  }

  Future<Shopping> getShoppingByID(String documentID) async {
    final document = await _shoppingDataSource.getShoppingByID(documentID);
    var mapShopping = GenericConverter.toMap(document);
    var shopping = Shopping.fromJson(mapShopping);

    return shopping;
  }

  Future<void> insertShopping(Map<String, dynamic> data) async =>
      await _shoppingDataSource.add(data);

  Future<BuiltList<Shopping>> getShoppingByProductId(String productId) async {
    final result = await _shoppingDataSource.getShoppingsByProductId(productId);

    BuiltList<Shopping> shoppings = new BuiltList<Shopping>();
    if (result.isNotEmpty) {
      for (DocumentSnapshot document in result) {
        var mapShopping = GenericConverter.toMap(document);
        var shopping = Shopping.fromJson(mapShopping);
        var brand = await _brandRepository.getBrandByID(shopping.data.brandId);
        var newShopping = shopping.rebuild((s) => s.data
            .replace(shopping.data.rebuild((b) => b..brand.replace(brand))));

        shoppings = (shoppings.toBuilder()..add(newShopping)).build();
      }
    }

    return shoppings;
  }
}
