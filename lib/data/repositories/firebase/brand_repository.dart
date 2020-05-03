import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remember_prices/data/models/brand/index.dart';
import 'package:remember_prices/data/network/brand/firebase/index.dart';
import 'package:remember_prices/data/repositories/helpers/index.dart';

class BrandRepository {
  final BrandDataSource _brandDataSource;

  BrandRepository(this._brandDataSource);

  Future<BuiltList<Brand>> getBrands() async {
    final result = await _brandDataSource.getBrands();
    BuiltList<Brand> brands = new BuiltList<Brand>();
    if (result.documents.isNotEmpty) {
      for (DocumentSnapshot document in result.documents) {
        var mapBrand = BrandConverter.toMap(document);
        var brand = Brand.fromJson(mapBrand);
        brands = (brands.toBuilder()..add(brand)).build();
      }
    }
    return brands;
  }

  Future<Brand> getBrandByID(String documentID) async {
    final document = await _brandDataSource.getBrandByID(documentID);
    var mapBrand = BrandConverter.toMap(document);
    var brand = Brand.fromJson(mapBrand);
    return brand;
  }

  Future<void> insertBrand(String name) async =>
      await _brandDataSource.insertBrand(name);

  Future<void> deleteBrand(String documentID) async =>
      await _brandDataSource.deleteBrand(documentID);

  Future<void> editBrand(String documentID, String name) async =>
      await _brandDataSource.editBrand(documentID, name);
}
