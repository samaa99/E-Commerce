import 'package:ecommerce_app_getx/core/view_model/profile_view_model.dart';
import 'package:ecommerce_app_getx/view/auth/login_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_profile_list_tile.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  late double _deviceWidth;
  late double _deviceHeight;
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                        image: DecorationImage(
                          image: AssetImage('assets/images/avatar.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _deviceWidth * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: controller.user?.name ?? 'David Spade',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: _deviceHeight * 0.01,
                        ),
                        CustomText(
                          text: controller.user?.email ?? 'iamdavid@gmail.com',
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: _deviceHeight * 0.055,
                ),
                ProfileListTile(
                  img: 'assets/images/Icon_edit.png',
                  title: 'Edit Profile',
                ),
                SizedBox(
                  height: _deviceHeight * 0.02,
                ),
                ProfileListTile(
                  img: 'assets/images/Icon_Location.png',
                  title: 'Shipping Address',
                ),
                SizedBox(
                  height: _deviceHeight * 0.02,
                ),
                ProfileListTile(
                  img: 'assets/images/Icon_History.png',
                  title: 'Order History',
                ),
                SizedBox(
                  height: _deviceHeight * 0.02,
                ),
                ProfileListTile(
                  img: 'assets/images/Icon_Payment.png',
                  title: 'Cards',
                ),
                SizedBox(
                  height: _deviceHeight * 0.02,
                ),
                ProfileListTile(
                  img: 'assets/images/Icon_Alert.png',
                  title: 'Notifications',
                ),
                SizedBox(
                  height: _deviceHeight * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    controller.signOut();
                    Get.offAll(() => LogInView());
                  },
                  child: ProfileListTile(
                    img: 'assets/images/Icon_Exit.png',
                    title: 'Log Out',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
