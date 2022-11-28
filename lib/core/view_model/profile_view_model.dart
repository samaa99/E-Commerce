import 'package:ecommerce_app_getx/core/services/firestore_save_user.dart';
import 'package:ecommerce_app_getx/core/services/local_storage.dart';
import 'package:ecommerce_app_getx/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  LocalStorage localStorage = Get.find<LocalStorage>();
  UserModel? _user;
  UserModel? get user => _user;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  getUser() async {
    _loading.value = true;
    await localStorage.getUser.then((value) {
      _user = value;
    });
    _loading.value = false;
    update();
    return _user;
  }

  signOut() async {
    GoogleSignIn().signOut();
    FacebookLogin().logOut();
    FirebaseAuth.instance.signOut();
    await localStorage.deleteUser();
  }
}
