import 'package:flutter/material.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/res.dart';

class SignupComponents {
  static Widget upperComponent() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: sizes!.heightRatio * 35),
          width: sizes!.widthRatio * 163.43,
          height: sizes!.heightRatio * 39.42,
          child: Image.asset(Assets.loginLogo),
        ),
        SizedBox(
          height: sizes!.heightRatio * 25,
        ),
        Text(
          'Join Us To Start Searching',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.loginWelcome,
            fontFamily: Assets.latoBlack,
            fontSize: sizes!.fontRatio * 24,
          ),
        ),
        SizedBox(
          height: sizes!.heightRatio * 7,
        ),
        Text(
          'Discover your perfect workspace',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.loginWelcome,
            fontFamily: Assets.latoRegular,
            fontSize: sizes!.fontRatio * 16,
          ),
        ),
      ],
    );
  }

}
