import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff00C569);
const String kCartTable = 'cart';
const String kColumnName = 'productName';
const String kColumnImage = 'img';
const String kColumnPrice = 'price';
const String kColumnQuantity = 'quantity';
const String kColumnProductId = 'productId';
const String kUSER_DATA = 'user';
const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum Delivery {
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery,
}
