import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDataSource {
  final Firestore db;

  ProductDataSource(this.db);

  CollectionReference get database => db.collection("products");

  Future<QuerySnapshot> getProducts() async => await database.getDocuments();

  Future<DocumentReference> insertProduct(Map<String, dynamic> data) async {
    var result = await database.add(data);

    return result;
  }

  deleteProduct(String documentID) async =>
      await database.document(documentID).delete();

  getDocumentIdByBarcode(String barcode) async {
    var query = await database
        .where("barcode", isEqualTo: barcode)
        .limit(1)
        .getDocuments();
    if (query.documents.length > 0) return query.documents.first;

    return null;
  }

  editProduct(String documentID, Map<String, dynamic> data) async {
    await database.document(documentID).updateData(data);
  }

  Future<DocumentSnapshot> getProductByID(String documentID) async =>
      await database.document(documentID).get();
}
