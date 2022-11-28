import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_getx/core/services/home_services.dart';
import 'package:ecommerce_app_getx/model/category_model.dart';
import 'package:ecommerce_app_getx/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  final List<Category> _categories = [];
  List<Category> get categories => _categories;

  final List<Product> _products = [];
  List<Product> get products => _products;

  HomeViewModel() {
    getCategories();
    getProducts();
  }

  getCategories() async {
    _loading.value = true;
    await HomeServices().getCategories().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categories
            .add(Category.fromJson(value[i].data() as Map<dynamic, dynamic>));
        //print(_categories);
        _loading.value = false;
      }
      update();
    });
  }

  getProducts() async {
    _loading.value = true;
    await HomeServices().getProducts().then((value) {
      for (int i = 0; i < value.length; i++) {
        _products
            .add(Product.fromJson(value[i].data() as Map<dynamic, dynamic>));
        //print(_categories);
        _loading.value = false;
      }
      update();
    });
  }
}
