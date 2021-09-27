
import 'package:flutter/material.dart';
import 'package:flutter_demo/res/assets.dart';

class HomeComponents {
  static Widget notificationButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.notificationIcon), fit: BoxFit.fill)),
      ),
    );
  }
}
