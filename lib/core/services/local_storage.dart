import 'dart:convert';

import 'package:ecommerce_app_getx/constants.dart';
import 'package:ecommerce_app_getx/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxController {
  get getUser async {
    try {
      UserModel user = await _getUser();
      if (user == null) {
        print('No data found');
        return;
      }
      return user;
    } catch (e) {
      print('There is no data: ${e.toString()}');
      return;
    }
  }

  _getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var getValue = sharedPreferences.getString(kUSER_DATA);
    // print(getValue);
    if (getValue != null) {
      return UserModel.fromJson(json.decode(getValue));
    } else {
      print('get user from preferences is empty');
      return '';
    }
  }

  setUser(UserModel user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences
        .setString(kUSER_DATA, json.encode(user.toJson()))
        .then((value) => print(value));
    print('Done with set user in preferences');
  }

  deleteUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(kUSER_DATA);
  }
}
