import 'package:flutter/material.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/res.dart';
class LoginComponents {
  bool ischeck = true;

  static Widget upperComponent() {
    return Container(
      margin: EdgeInsets.only(left: sizes!.widthRatio * 10, right: sizes!.widthRatio * 10, top: sizes!.heightRatio * 25),
      child: Column(
        children: [
          Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 24,
              fontFamily: Assets.latoBlack,
              fontWeight: FontWeight.bold,
              color: AppColors.loginWelcome,
            ),
          ),
          SizedBox(
            height: sizes!.heightRatio * 10,
          ),
          Text(
            'You can search cafés, Restaurants, Workspaces and offices in your near location.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontFamily: Assets.latoRegular,
              color: AppColors.logininfo,
            ),
          ),
          SizedBox(
            height: sizes!.heightRatio * 15,
          ),
        ],
      ),
    );
  }
}
