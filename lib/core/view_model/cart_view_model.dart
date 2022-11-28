import 'package:ecommerce_app_getx/core/services/database/cart_database_helper.dart';
import 'package:ecommerce_app_getx/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProduct> _cartProducts = [];
  List<CartProduct> get cartProducts => _cartProducts;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;
  var cartDatabaseHelper = CartDatabaseHelper.cartDbHelper;

  CartViewModel() {
    getProducts();
  }

  addProduct(CartProduct cartProduct) async {
    for (int i = 0; i < _cartProducts.length; i++) {
      if (_cartProducts[i].productId == cartProduct.productId) {
        _cartProducts[i].quantity++;
        _totalPrice += double.parse(_cartProducts[i].price);
        cartDatabaseHelper.updateCartProducts(_cartProducts[i]);
      }
    }
    await cartDatabaseHelper.insert(cartProduct);
    _cartProducts.add(cartProduct);
    _totalPrice += (double.parse(cartProduct.price) * cartProduct.quantity);
    update();
  }

  getProducts() async {
    loading.value = true;
    _cartProducts = await cartDatabaseHelper.getAllCartProducts();
    getTotalPrice();
    print(_cartProducts.length);
    loading.value = false;
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProducts.length; i++) {
      _totalPrice +=
          (double.parse(_cartProducts[i].price) * _cartProducts[i].quantity);
    }
  }

  increaseQuantity(int index) async {
    _cartProducts[index].quantity++;
    _totalPrice += double.parse(_cartProducts[index].price);
    cartDatabaseHelper.updateCartProducts(_cartProducts[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProducts[index].quantity--;
    _totalPrice -= double.parse(_cartProducts[index].price);
    cartDatabaseHelper.updateCartProducts(_cartProducts[index]);
    update();
  }
}
