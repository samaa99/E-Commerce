import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app_getx/view/checkout/delivery_view.dart';
import 'package:ecommerce_app_getx/view/checkout/main_checkout_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartView extends StatelessWidget {
  late double _deviceWidth;
  late double _deviceHeight;
  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(16),
      child: _buildBodyUI(),
    );
  }

  Widget _buildBodyUI() {
    return GetBuilder<CartViewModel>(
      init: Get.find<CartViewModel>(),
      builder: (controller) => controller.cartProducts.isEmpty
          ? buildEmptyCartUI()
          : Column(
              children: [
                _buildCartListView(),
                _buildBottomBarUI(),
              ],
            ),
    );
  }

  Widget buildEmptyCartUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/empty_cart.svg',
          height: 200,
          width: 200,
        ),
        SizedBox(
          height: _deviceHeight * 0.03,
        ),
        const CustomText(
          alignment: Alignment.center,
          text: 'The cart is empty',
          fontSize: 22,
        ),
      ],
    );
  }

  Widget _buildCartListView() {
    return GetBuilder<CartViewModel>(
        init: Get.find<CartViewModel>(),
        builder: (controller) {
          // print(controller.cartProducts.length);
          return Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: _deviceHeight * 0.2,
                        width: _deviceWidth * 0.35,
                        child: Image.network(
                          controller.cartProducts[index].img,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: _deviceWidth * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: controller.cartProducts[index].productName,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: _deviceHeight * 0.02,
                          ),
                          CustomText(
                            text: '\$${controller.cartProducts[index].price}',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            height: _deviceHeight * 0.02,
                          ),
                          Container(
                            color: Colors.grey.shade300,
                            width: _deviceWidth * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    child: Icon(Icons.add),
                                  ),
                                  onTap: () {
                                    controller.increaseQuantity(index);
                                  },
                                ),
                                CustomText(
                                  text: controller.cartProducts[index].quantity
                                      .toString(),
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 15),
                                    child: Icon(Icons.minimize),
                                  ),
                                  onTap: () {
                                    controller.decreaseQuantity(index);
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: _deviceHeight * 0.02,
                  );
                },
                itemCount: controller.cartProducts.length),
          );
        });
  }

  Widget _buildBottomBarUI() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'TOTAL',
                color: Colors.grey,
              ),
              SizedBox(
                height: _deviceHeight * 0.01,
              ),
              GetBuilder<CartViewModel>(
                init: Get.find<CartViewModel>(),
                builder: (controller) => CustomText(
                  text: '\$${controller.totalPrice}',
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            width: _deviceWidth * 0.35,
            child: CustomButton(
                title: 'CHECKOUT',
                onPressed: () {
                  Get.to(() => const DeliveryView());
                }),
          ),
        ],
      ),
    );
  }
}
