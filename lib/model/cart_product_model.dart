class CartProduct {
  String productName;
  String img;
  String price;
  int quantity;
  String productId;
  CartProduct({
    required this.productName,
    required this.img,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  factory CartProduct.fromJson(Map<dynamic, dynamic> json) {
    return CartProduct(
      productName: json['productName'],
      img: json['img'],
      price: json['price'],
      quantity: json['quantity'],
      productId: json['productId'],
    );
  }

  toJson() {
    return {
      'productName': productName,
      'img': img,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
