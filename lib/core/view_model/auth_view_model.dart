import 'package:ecommerce_app_getx/core/services/firestore_save_user.dart';
import 'package:ecommerce_app_getx/core/services/local_storage.dart';
import 'package:ecommerce_app_getx/model/user_model.dart';
import 'package:ecommerce_app_getx/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  String? email, password, name;
  Rxn<User> _firebaseUser = Rxn<User>();
  LocalStorage localStorage = Get.find<LocalStorage>();

  get user => _firebaseUser.value?.email;
  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
    //getCurrentUser(_auth.currentUser!.uid);
  }

  void signInWithGoogle() async {
    GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();
    // print(signInAccount);
    GoogleSignInAuthentication googleSignInAuthentication =
        await signInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      Get.offAll(() => ControlView());
    });
    // print('user credential: $userCredential');
  }

  void signInWithFacebook() async {
    FacebookLoginResult facebookLoginResult =
        await _facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

    final FacebookAccessToken? accessToken = facebookLoginResult.accessToken;

    if (facebookLoginResult.status == FacebookLoginStatus.success) {
      final credential = FacebookAuthProvider.credential(accessToken!.token);
      await _auth.signInWithCredential(credential).then((user) async {
        saveUser(user);
        Get.offAll(() => ControlView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        print('signin: ${user.user!.uid}');
        getCurrentUser(user.user!.uid);
        Get.offAll(ControlView());
      });
    } catch (e, s) {
      print(e.toString());
      print('Stack: $s');
      Get.snackbar(
        "Error LogIn",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
        Get.offAll(() => ControlView());
      });
      print('success');
    } catch (e) {
      Get.snackbar(
        "Error LogIn",
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email!,
      name: name ?? user.user!.displayName!,
      img: '',
    );
    setUser(userModel);
    await FireStoreUser().addUserToFireStore(userModel);
    print(userModel);

    print(userModel);
  }

  void setUser(UserModel user) async {
    await localStorage.setUser(user);
    print('setUser done');
    print(user);
  }

  void getCurrentUser(String uid) async {
    await FireStoreUser().getUser(uid).then((value) {
      // print('save user data with the beginning: get user done');
      // print(value);
      setUser(UserModel.fromJson(value.data() as Map));
    });
  }
}
