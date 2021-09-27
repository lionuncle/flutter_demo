import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_demo/animations/slide_right.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/colors.dart';
import 'package:flutter_demo/res/res.dart';
import 'package:flutter_demo/screens/login_screen/login_components.dart';
import 'package:flutter_demo/screens/login_screen/login_provider.dart';
import 'package:flutter_demo/screens/signup_screen/signup_screen.dart';
import 'package:flutter_demo/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginProvider? loginProvider;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? forgotPasswordEmailController;

  int bottomSheetHeight = 400;

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    forgotPasswordEmailController = TextEditingController();
    loginProvider = LoginProvider();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider?.init(context: context);
    forgotPasswordEmailController!.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    loginProvider = Provider.of<LoginProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          height: sizes!.height,
          width: sizes!.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.appBgImage), fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: sizes!.heightRatio * 55.11),
                    width: sizes!.widthRatio * 163.43,
                    height: sizes!.heightRatio * 39.42,
                    child: Image.asset(Assets.loginLogo),
                  ),
                  LoginComponents.upperComponent(),
                  Container(
                    margin: EdgeInsets.only(
                        left: sizes!.widthRatio * 10,
                        right: sizes!.widthRatio * 10,
                        top: sizes!.heightRatio * 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.smallButton(
                                'Google',
                                sizes!.widthRatio * 153.5,
                                sizes!.heightRatio * 45,
                                Assets.googleIcon),
                            SizedBox(
                              width: sizes!.widthRatio * 13,
                            ),
                            CommonWidgets.smallButton(
                                'Facebook',
                                sizes!.widthRatio * 153.5,
                                sizes!.heightRatio * 45,
                                Assets.facebookIcon),
                          ],
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 20,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: sizes!.widthRatio * 10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CommonWidgets.loginText('Email', 15)),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 10,
                        ),
                        CommonWidgets.customTextField(Icons.check, false,
                            placeHolder: "randy.hudson@mail.com",
                            controller: emailController),
                        SizedBox(
                          height: sizes!.heightRatio * 10,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: sizes!.widthRatio * 10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CommonWidgets.loginText('Password', 15)),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 10,
                        ),
                        CommonWidgets.customTextField(
                            Icons.visibility_outlined, true,
                            placeHolder: "********",
                            controller: passwordController),
                        SizedBox(
                          height: sizes!.heightRatio * 20,
                        ),
                        CommonWidgets.customCheckbox(true),
                        SizedBox(
                          height: sizes!.heightRatio * 15,
                        ),
                        CommonWidgets.mainButton('Login',
                            onpress: goToFeatures),
                        TextButton(
                            onPressed: () {
                              openSheet();
                            },
                            child: CommonWidgets.loginText(
                                'Forgot Password ?', 13)),
                        CommonWidgets.alreadyAccountRow(
                            text1: 'Don’t have an account?',
                            text2: 'Sign Up',
                            onPress: goToSignup),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void goToSignup() {
    //Navigator.pushNamed(context, Routes.signup);
    Navigator.push(context, SlideRightRoute(page: SignupScreen()));
  }

  void goToFeatures() async {
    //Navigator.pushNamed(context, Routes.features);
    //Navigator.push(context, SlideRightRoute(page: FeaturesScreen()));
    await loginProvider?.callLoginApi(
        email: emailController?.text, password: passwordController?.text);
  }

  // void callApi() async {
  //   await loginProvider?.callForgotPasswordApi(
  //       email: forgotPasswordEmailController?.text);
  // }

  void openSheet() {
    setState(() {
      BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10));
    });
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (context) => SingleChildScrollView(
              child: Container(
                //margin: EdgeInsets.only(top: sizes!.heightRatio * 58.74),
                padding:
                    EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 10),
                height: sizes!.heightRatio * bottomSheetHeight,
                decoration: BoxDecoration(
                  //color: AppColors.appBackground,
                  image: DecorationImage(
                      image: AssetImage(Assets.appBgImage), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: sizes!.heightRatio * 50,
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: Assets.latoBlack,
                        color: AppColors.loginWelcome,
                      ),
                    ),
                    SizedBox(
                      height: sizes!.heightRatio * 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizes!.widthRatio * 3),
                      child: Text(
                        'Enter your Email address and we will share a link at your Email.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: Assets.latoRegular,
                          color: AppColors.logininfo,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizes!.heightRatio * 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: sizes!.widthRatio * 10),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: CommonWidgets.loginText('Email', 15)),
                    ),
                    SizedBox(
                      height: sizes!.heightRatio * 10,
                    ),
                    CommonWidgets.customTextField(Icons.check, false,
                        placeHolder: "randy.hudson@mail.com",
                        controller: forgotPasswordEmailController),
                    SizedBox(
                      height: sizes!.heightRatio * 70,
                    ),
                    CommonWidgets.mainButton('Submit', onpress: () {}),
                  ],
                ),
              ),
            ));
  }
}
