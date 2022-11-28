import 'package:ecommerce_app_getx/core/view_model/cart_view_model.dart';
import 'package:ecommerce_app_getx/model/cart_product_model.dart';
import 'package:ecommerce_app_getx/model/product_model.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_button.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductDetailsView extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  Product product;
  ProductDetailsView(this.product);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _buildBodyUI(),
    );
  }

  Column _buildBodyUI() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: _deviceWidth,
              child: Image.network(
                product.img,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomText(
                text: product.productName,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: _deviceHeight * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: _deviceWidth * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CustomText(
                          text: 'Size',
                        ),
                        CustomText(
                          text: product.size,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: _deviceWidth * 0.44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CustomText(
                          text: 'Color',
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: product.color,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey.shade400)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _deviceHeight * 0.04,
              ),
              const CustomText(
                text: 'Details',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: _deviceHeight * 0.01,
              ),
              CustomText(
                text: product.details,
              ),
              SizedBox(
                height: _deviceHeight * 0.02,
              ),
            ],
          ),
        ),
        _buildBottomRow(),
        SizedBox(
          height: _deviceHeight * 0.01,
        ),
      ],
    );
  }

  // Widget _buildDetailsColumn() {
  //   return Column(
  //     children: [
  //       const CustomText(
  //         text: 'Details',
  //         fontSize: 18,
  //         fontWeight: FontWeight.bold,
  //       ),
  //       SizedBox(
  //         height: _deviceHeight * 0.01,
  //       ),
  //       CustomText(
  //         text: product.details,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildBottomRow() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const CustomText(
                text: 'PRICE',
                color: Colors.grey,
              ),
              CustomText(
                text: '\$${product.price}',
              ),
            ],
          ),
          GetBuilder<CartViewModel>(
            init: Get.find<CartViewModel>(),
            builder: (controller) => Container(
              width: _deviceWidth * 0.35,
              child: CustomButton(
                  title: 'ADD',
                  onPressed: () {
                    controller.addProduct(CartProduct(
                      productName: product.productName,
                      img: product.img,
                      price: product.price,
                      quantity: 1,
                      productId: product.productId,
                    ));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
