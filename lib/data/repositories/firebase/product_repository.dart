import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remember_prices/data/models/product/index.dart';
import 'package:remember_prices/data/network/brand/firebase/index.dart';
import 'package:remember_prices/data/repositories/firebase/index.dart';

import 'package:remember_prices/data/repositories/helpers/index.dart';

class ProductRepository {
  final ProductDataSource _productDataSource;
  final BrandRepository _brandRepository;

  ProductRepository(this._productDataSource, this._brandRepository);

  Future<BuiltList<Product>> getProducts() async {
    final result = await _productDataSource.getProducts();
    BuiltList<Product> products = new BuiltList<Product>();
    if (result.documents.isNotEmpty) {
      for (DocumentSnapshot document in result.documents) {
        var mapProduct = ProductConverter.toMap(document);
        var product = Product.fromJson(mapProduct);
        products = (products.toBuilder()..add(product)).build();
      }
    }
    return products;
  }

  Future<Product> getProductByID(String documentID) async {
    final document = await _productDataSource.getProductByID(documentID);
    var mapProduct = ProductConverter.toMap(document);
    var product = Product.fromJson(mapProduct);
    return product;
  }

  Future<void> insertProduct(String name) async =>
      await _productDataSource.insertProduct(name);

  Future<void> deleteProduct(String documentID) async =>
      await _productDataSource.deleteProduct(documentID);

  Future<String> getDocumentIdByBarcode(String barcode) async {
    var document = await _productDataSource.getDocumentIdByBarcode(barcode);
    var mapProduct = ProductConverter.toMap(document);
    var product = Product.fromJson(mapProduct);

    return product.documentID;
  }

  Future<Product> editProduct(
          String documentID, Map<String, dynamic> data) async =>
      await _productDataSource.editProduct(documentID, data);
}
