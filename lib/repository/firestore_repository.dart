import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestoreに関するRepositoryクラスです。
class FirestoreRepository {
  /// 商品の登録を行います。
  static Future<void> setProduct({
    required String id,
    required String name,
  }) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .set({'name': name});
  }
}
