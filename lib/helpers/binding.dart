import 'package:ecommerce_app_getx/core/services/local_storage.dart';
import 'package:ecommerce_app_getx/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app_getx/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app_getx/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app_getx/core/view_model/control_view_model.dart';
import 'package:ecommerce_app_getx/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.put(HomeViewModel());
    Get.put(CartViewModel());
    Get.put(LocalStorage());
    Get.put(CheckOutViewModel());
  }
}
