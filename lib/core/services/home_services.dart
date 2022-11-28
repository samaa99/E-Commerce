import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference<Map<dynamic, dynamic>> _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference<Map<dynamic, dynamic>> _productsCollectionRef =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    final value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProducts() async {
    final value = await _productsCollectionRef.get();
    return value.docs;
  }
}
