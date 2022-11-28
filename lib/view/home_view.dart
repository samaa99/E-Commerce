import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/core/view_model/control_view_model.dart';
import 'package:ecommerce_app_getx/core/view_model/home_view_model.dart';
import 'package:ecommerce_app_getx/view/auth/login_view.dart';
import 'package:ecommerce_app_getx/view/product_details_view.dart';
import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  late double _deviceWidth;
  late double _deviceHeight;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.grey.shade50,
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    children: [
                      _buildSearchTextField(),
                      SizedBox(
                        height: _deviceHeight * 0.03,
                      ),
                      _buildCategoriesComponent(),
                      SizedBox(
                        height: _deviceHeight * 0.06,
                      ),
                      _buildBestSellingComponent(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildSearchTextField() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCategoriesComponent() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Column(
        children: [
          const CustomText(
            text: 'Categories',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: _deviceHeight * 0.02,
          ),
          Container(
            height: _deviceHeight * 0.12,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        clipBehavior: Clip.antiAlias,
                        height: 60,
                        width: 60,
                        child: Image.network(controller.categories[index].img),
                      ),
                      SizedBox(
                        height: _deviceHeight * 0.01,
                      ),
                      CustomText(
                        text: controller.categories[index].categoryName,
                        fontSize: 12,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: _deviceWidth * 0.02,
                    ),
                itemCount: controller.categories.length),
          )
        ],
      ),
    );
  }

  Widget _buildBestSellingComponent() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomText(
                text: 'Best Selling',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: 'See all',
                fontSize: 16,
              ),
            ],
          ),
          SizedBox(
            height: _deviceHeight * 0.02,
          ),
          Container(
            height: _deviceHeight * 0.5,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(ProductDetailsView(controller.products[index]));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          controller.products[index].img,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: _deviceHeight * 0.02,
                        ),
                        CustomText(
                          text: controller.products[index].productName,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: _deviceHeight * 0.01,
                        ),
                        CustomText(
                          text: controller.products[index].description,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        SizedBox(
                          height: _deviceHeight * 0.01,
                        ),
                        CustomText(
                          text: '\$${controller.products[index].price}',
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: _deviceWidth * 0.02,
                    ),
                itemCount: controller.products.length),
          )
        ],
      ),
    );
  }
}
