import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app_getx/core/view_model/checkout_view_model.dart';
import 'package:ecommerce_app_getx/view/control_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryView extends StatelessWidget {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'Summary',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                width: MediaQuery.of(context).size.width,
                child: GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                controller.cartProducts[index].img,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text:
                                    controller.cartProducts[index].productName,
                              ),
                              CustomText(
                                text:
                                    '\$${controller.cartProducts[index].price}',
                                color: kPrimaryColor,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                      itemCount: controller.cartProducts.length),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomText(
                text: 'Shipping Address',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CheckOutViewModel>(
                  init: Get.find<CheckOutViewModel>(),
                  builder: (controller) {
                    return Column(
                      children: [
                        CustomText(
                          text: '${controller.street1}, ',
                          fontSize: 16,
                        ),
                        CustomText(
                          text: '${controller.street2}, ',
                          fontSize: 16,
                        ),
                        CustomText(
                          text:
                              '${controller.city}, ${controller.state}, ${controller.country}, ',
                          fontSize: 16,
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
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
                                  Get.to(() => ControlView());
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
