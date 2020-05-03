import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductConverter {
  static toMap(DocumentSnapshot document) {
    Map<String, dynamic> productMap = {
      "documentID": document.documentID,
      "data": document.data
    };
    return json.encode(productMap);
  }
}
