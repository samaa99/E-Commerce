import 'package:ecommerce_app_getx/view/cart_view.dart';
import 'package:ecommerce_app_getx/view/home_view.dart';
import 'package:ecommerce_app_getx/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  Widget _currentScreen = HomeView();
  int _navigatorValue = 0;
  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;
  void updateNavigatorValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
