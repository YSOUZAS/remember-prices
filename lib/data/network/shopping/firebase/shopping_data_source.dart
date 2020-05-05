import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingDataSource {
  final Firestore db;

  ShoppingDataSource(this.db);

  CollectionReference get database => db.collection("shoppings");

  Future<QuerySnapshot> getShoppings() async => await database.getDocuments();

  Future<DocumentReference> add(Map<String, dynamic> data) async =>
      await database.add(data);

  Future<DocumentSnapshot> getShoppingByID(String documentId) async =>
      await database.document(documentId).get();

  Future<List<DocumentSnapshot>> getShoppingsByProductId(
      String productId) async {
    var query =
        await database.where("productId", isEqualTo: productId).getDocuments();

    return query.documents;
  }
}
