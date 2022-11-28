import 'package:ecommerce_app_getx/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app_getx/view/auth/signup_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_social_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../widgets/custom_form_text_field.dart';

class LogInView extends GetWidget<AuthViewModel> {
  late double _deviceWidth;
  late double _deviceHeight;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LogInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: _buildBodyUI(),
    );
  }

  Widget _buildBodyUI() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 50, right: 20, left: 20),
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Welcome,',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUpView());
                    },
                    child: const CustomText(
                      text: 'Sign Up',
                      fontSize: 18,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _deviceHeight * 0.01,
              ),
              const CustomText(
                text: 'Sign in to Continue',
                fontSize: 14,
                color: Color(0xff929292),
              ),
              SizedBox(
                height: _deviceHeight * 0.05,
              ),
              CustomFormTextField(
                title: 'Email',
                hint: 'iamdavid@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('value is null');
                  }
                },
              ),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              CustomFormTextField(
                title: 'Password',
                hint: '*************',
                obsecureText: true,
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('value is null');
                  }
                },
              ),
              SizedBox(
                height: _deviceHeight * 0.02,
              ),
              const CustomText(
                text: 'Forgot Password?',
                alignment: Alignment.topRight,
              ),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              CustomButton(
                title: 'SIGN IN',
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
              ),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              const CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              CustomSocialButton(
                title: 'Sign In with Facebook',
                imgPath: 'assets/images/facebookIcon.png',
                onPressed: () {
                  controller.signInWithFacebook();
                },
              ),
              SizedBox(
                height: _deviceHeight * 0.02,
              ),
              CustomSocialButton(
                title: 'Sign In with Google',
                imgPath: 'assets/images/googleIcon.png',
                onPressed: () {
                  controller.signInWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
