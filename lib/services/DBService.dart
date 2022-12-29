import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorr/model/AreaModel.dart';
import 'package:favorr/model/FavorrModel.dart';
import 'package:flutter/widgets.dart';

CollectionReference area_coll = FirebaseFirestore.instance.collection('area');
CollectionReference favorr_coll =
    FirebaseFirestore.instance.collection('favorr');

class Database {
  static Stream<QuerySnapshot> getAreas() => area_coll.snapshots();
  static Stream<QuerySnapshot> getFavorrs() => favorr_coll.snapshots();

  static Future addArea({required Area area}) async {
    DocumentReference docRef = area_coll.doc();

    await docRef
        .set(area.toJson())
        .whenComplete(() => print('data masuk'))
        .catchError((e) => print(e));
  }

  static Future addFavorr({required Favorr area}) async {
    DocumentReference docRef = area_coll.doc();

    await docRef
        .set(area.toJson())
        .whenComplete(() => print('data masuk'))
        .catchError((e) => print(e));
  }
}
