import 'package:ecommerce_app_getx/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app_getx/view/auth/login_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_form_text_field.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  late double _deviceHeight;
  late double _deviceWidth;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.to(LogInView());
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: _BuildBodyUI(),
    );
  }

  Widget _BuildBodyUI() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
          color: Colors.white,
          child: Column(
            children: [
              const CustomText(
                text: 'Sign Up',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              SizedBox(
                height: _deviceHeight * 0.05,
              ),
              CustomFormTextField(
                title: 'Name',
                hint: 'David Spade',
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                },
              ),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              CustomFormTextField(
                title: 'Email',
                hint: 'iamdavid@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                },
              ),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              CustomFormTextField(
                title: 'Password',
                hint: '************',
                obsecureText: true,
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }
                },
              ),
              SizedBox(
                height: _deviceHeight * 0.06,
              ),
              CustomButton(
                title: 'SIGN UP',
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signUpWithEmailAndPassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
