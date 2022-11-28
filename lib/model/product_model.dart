import 'package:ecommerce_app_getx/helpers/extenstion.dart';
import 'package:flutter/material.dart';

class Product {
  String productName;
  String img;
  String description;
  String details;
  String size;
  Color color;
  String price;
  String productId;

  Product({
    required this.productName,
    required this.img,
    required this.description,
    required this.details,
    required this.size,
    required this.color,
    required this.price,
    required this.productId,
  });

  factory Product.fromJson(Map<dynamic, dynamic> json) {
    return Product(
      productName: json['productName'],
      img: json['img'],
      description: json['description'],
      details: json['details'],
      size: json['size'],
      color: HexColor.fromHex(json['color']),
      price: json['price'],
      productId: json['productId'],
    );
  }

  toJson() {
    return {
      'productName': productName,
      'img': img,
      'description': description,
      'details': details,
      'size': size,
      'color': color,
      'price': price,
      'productId': productId,
    };
  }
}
