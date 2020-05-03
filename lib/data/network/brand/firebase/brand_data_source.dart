import 'package:cloud_firestore/cloud_firestore.dart';

class BrandDataSource {
  final Firestore db;

  BrandDataSource(this.db);

  CollectionReference get database => db.collection("brands");

  Future<QuerySnapshot> getBrands() async => await database.getDocuments();

  insertBrand(String name) async =>
      await database.add({"name": name, "imageUrl": ""});

  deleteBrand(String documentID) async =>
      await database.document(documentID).delete();

  editBrand(String documentID, String name) async =>
      await database.document(documentID).updateData({"name": name});

  Future<DocumentSnapshot> getBrandByID(String documentID) async =>
      await database.document(documentID).get();
}
