import 'package:ecommerce_app_getx/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  String img;
  String title;
  ProfileListTile({
    required this.img,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(img),
      title: CustomText(
        text: title,
        fontSize: 18,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
        size: 20,
      ),
    );
  }
}
