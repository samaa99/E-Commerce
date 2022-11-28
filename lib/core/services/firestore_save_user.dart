import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_getx/model/user_model.dart';

class FireStoreUser {
  final _fireStoreCollectionRef =
      FirebaseFirestore.instance.collection('users');
  Future<void> addUserToFireStore(UserModel userModel) async {
    return await _fireStoreCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getUser(String userId) async {
    return await _fireStoreCollectionRef.doc(userId).get();
  }
}
