import 'package:ecommerce_app_getx/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app_getx/helpers/binding.dart';
import 'package:ecommerce_app_getx/view/auth/login_view.dart';
import 'package:ecommerce_app_getx/view/control_view.dart';
import 'package:ecommerce_app_getx/view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    // SplashView(
    //   onInitializationComplete: () =>
    const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: ControlView(),
    );
  }
}
