import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BrandConverter {
  static toMap(DocumentSnapshot document) {
    Map<String, dynamic> brandMap = {
      "documentID": document.documentID,
      "data": document.data
    };
    return json.encode(brandMap);
  }
}
