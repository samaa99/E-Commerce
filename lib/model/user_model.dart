class UserModel {
  String userId;
  String email;
  String name;
  String img;

  UserModel(
      {required this.userId,
      required this.email,
      required this.name,
      required this.img});

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      email: json['email'],
      name: json['name'],
      img: json['img'],
    );
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'img': img,
    };
  }
}
