import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app_getx/view/checkout/delivery_view.dart';
import 'package:ecommerce_app_getx/view/checkout/summary_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_form_text_field.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'Address',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/radio.png'),
                      const CustomText(
                        text: 'Billing address is the same as delivery address',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomFormTextField(
                    title: 'Street 1',
                    hint: '21, Alex Davidson Avenue',
                    onSave: (value) {
                      controller.street1 = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Street1 is required';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomFormTextField(
                    title: 'Street 2',
                    hint: 'Opposite Omegatron, Vicent Quarters',
                    onSave: (value) {
                      controller.street2 = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Street2 is required';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomFormTextField(
                    title: 'City',
                    hint: 'Victoria Island',
                    onSave: (value) {
                      controller.city = value!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'City is required';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomFormTextField(
                            title: 'State',
                            hint: 'Lagos State',
                            onSave: (value) {
                              controller.state = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'State is required';
                              }
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: CustomFormTextField(
                            title: 'Country',
                            hint: 'Nigeria',
                            onSave: (value) {
                              controller.country = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Country is required';
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Get.off(() => const DeliveryView());
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(16)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                side: BorderSide(color: kPrimaryColor),
                              ),
                            ),
                          ),
                          child: const CustomText(
                            text: 'BACK',
                            alignment: Alignment.center,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomButton(
                          title: 'NEXT',
                          onPressed: () {
                            controller.key.currentState!.save();
                            if (controller.key.currentState!.validate()) {
                              Get.to(() => const SummaryView());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
