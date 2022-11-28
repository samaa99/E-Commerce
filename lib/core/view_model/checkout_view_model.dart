import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController {
  int _index = 0;
  int get index => _index;
  Pages _page = Pages.DeliveryTime;
  Pages get page => _page;
  String street1 = '';
  String street2 = '';
  String city = '';
  String state = '';
  String country = '';
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void changeIndex(int i) {
    _index = i;
    if (_index == 1) {
      _page = Pages.AddAddress;
    } else if (_index == 2) {
      _page = Pages.Summary;
    } else if (_index == 3) {
      Get.to(ControlView());
    }
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}
