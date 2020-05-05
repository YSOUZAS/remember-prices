import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class GenericConverter {
  static toMap(DocumentSnapshot document) {
    Map<String, dynamic> map = {
      "documentID": document.documentID,
      "data": document.data
    };
    return json.encode(map);
  }
}
