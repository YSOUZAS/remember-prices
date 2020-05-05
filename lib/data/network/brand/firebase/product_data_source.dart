import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remember_prices/data/models/product/index.dart';

class ProductDataSource {
  final Firestore db;

  ProductDataSource(this.db);

  CollectionReference get database => db.collection("products");

  Future<QuerySnapshot> getProducts() async => await database.getDocuments();

  insertProduct(String name) async =>
      await database.add({"name": name, "imageUrl": ""});

  deleteProduct(String documentID) async =>
      await database.document(documentID).delete();

  getDocumentIdByBarcode(String barcode) async {
    var query = await database
        .where("barcode", isEqualTo: barcode)
        .limit(1)
        .getDocuments();

    return query.documents.first;
  }

  editProduct(String documentID, Map<String, dynamic> data) async {
    await database.document(documentID).updateData(data);
  }

  Future<DocumentSnapshot> getProductByID(String documentID) async =>
      await database.document(documentID).get();
}
