import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDataSource {
  final Firestore db;

  ProductDataSource(this.db);

  CollectionReference get database => db.collection("products");

  Future<QuerySnapshot> getProducts() async => await database.getDocuments();

  insertProduct(String name) async =>
      await database.add({"name": name, "imageUrl": ""});

  deleteProduct(String documentID) async =>
      await database.document(documentID).delete();

  editProduct(String documentID, String name) async =>
      await database.document(documentID).updateData({"name": name});

  Future<DocumentSnapshot> getProductByID(String documentID) async =>
      await database.document(documentID).get();
}
