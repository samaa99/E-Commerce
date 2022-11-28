import 'package:ecommerce_app_getx/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app_getx/core/view_model/control_view_model.dart';
import 'package:ecommerce_app_getx/view/auth/login_view.dart';
import 'package:ecommerce_app_getx/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Get.find<AuthViewModel>().user == null
          ? LogInView()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: _buildBottpmNavigationBar(),
              ),
            ),
    );
  }

  Widget _buildBottpmNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: const Text(
              'Explore',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            label: '',
            icon: Image.asset('assets/images/Icon_Explore.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: const Text(
              'Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            label: '',
            icon: Image.asset('assets/images/Icon_Cart.png'),
          ),
          BottomNavigationBarItem(
            activeIcon: const Text(
              'Account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            label: '',
            icon: Image.asset('assets/images/Icon_User.png'),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) => controller.updateNavigatorValue(index),
      ),
    );
  }
}
