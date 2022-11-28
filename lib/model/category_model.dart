class Category {
  String categoryName;
  String img;

  Category({required this.categoryName, required this.img});

  factory Category.fromJson(Map<dynamic, dynamic> json) {
    return Category(
      categoryName: json['categoryName'],
      img: json['img'],
    );
  }

  toJson() {
    return {
      'categoryName': categoryName,
      'img': img,
    };
  }
}
