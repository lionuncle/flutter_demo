import 'package:flutter/material.dart';
import 'package:flutter_demo/network/api_url.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/res.dart';
import 'package:flutter_demo/screens/signup_screen/signup_components.dart';
import 'package:flutter_demo/screens/signup_screen/signup_provider.dart';
import 'package:flutter_demo/widgets/common_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupProvider? signUpProvider;
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;
  TextEditingController? phoneNoController;
  //File? _image;
  String? imgString;
  ImagePicker? imagePicker = ImagePicker();

  Future getImage() async {
    final dynamic image = await imagePicker?.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        signUpProvider?.myImage = File(image.path);
        signUpProvider?.pickedImage = true;
        imgString = baseUrl + signUpProvider!.myImage!.path;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNoController = TextEditingController();

    signUpProvider = SignupProvider();
    signUpProvider = Provider.of<SignupProvider>(context, listen: false);
    signUpProvider?.init(context: context);
  }

  @override
  Widget build(BuildContext context) {
    signUpProvider = Provider.of<SignupProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
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
                  Padding(
                    padding: EdgeInsets.only(
                        left: sizes!.pagePadding, top: sizes!.largePadding),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CommonWidgets.customBackButton(context)),
                  ),
                  SignupComponents.upperComponent(),
                  Container(
                    margin: EdgeInsets.only(
                        left: sizes!.widthRatio * 10,
                        right: sizes!.widthRatio * 10,
                        top: sizes!.heightRatio * 25),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: sizes!.widthRatio * 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CommonWidgets.loginText('Full Name', 15),
                          ),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 5,
                        ),
                        CommonWidgets.customTextField(Icons.check, false,
                            placeHolder: "Ronald Wallace",
                            controller: nameController),
                        SizedBox(
                          height: sizes!.heightRatio * 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: sizes!.widthRatio * 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CommonWidgets.loginText('Email', 15),
                          ),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 5,
                        ),
                        CommonWidgets.customTextField(Icons.check, false,
                            placeHolder: "randy.hudson@mail.com",
                            controller: emailController),
                        SizedBox(
                          height: sizes!.heightRatio * 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: sizes!.widthRatio * 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CommonWidgets.loginText('Password', 15),
                          ),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 5,
                        ),
                        CommonWidgets.customTextField(Icons.visibility, true,
                            placeHolder: "********",
                            controller: passwordController),
                        SizedBox(
                          height: sizes!.heightRatio * 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: sizes!.widthRatio * 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child:
                                CommonWidgets.loginText('Confirm Password', 15),
                          ),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 5,
                        ),
                        CommonWidgets.customTextField(Icons.visibility, true,
                            placeHolder: "********",
                            controller: confirmPasswordController),
                        SizedBox(
                          height: sizes!.heightRatio * 15,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: sizes!.widthRatio * 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CommonWidgets.loginText('Phone Number', 15),
                          ),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 5,
                        ),
                        CommonWidgets.customTextFieldNoIcon(false,
                            controller: phoneNoController),
                        SizedBox(
                          height: sizes!.heightRatio * 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Image.asset(
                            Assets.uploadIcon,
                          ),
                        ),
                        SizedBox(
                          height: sizes!.heightRatio * 7,
                        ),
                        CommonWidgets.customCheckbox(true),
                        SizedBox(
                          height: sizes!.heightRatio * 20,
                        ),
                        CommonWidgets.mainButton('Sign Up',
                            onpress: getSignUpApi),
                        SizedBox(
                          height: sizes!.heightRatio * 20,
                        ),
                        CommonWidgets.alreadyAccountRow(
                            text1: 'Already have an account?',
                            text2: 'Login',
                            onPress: goToLogin),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getSignUpApi() async {
    await signUpProvider?.callSignUpApi(
        name: nameController?.text,
        email: emailController?.text,
        password: passwordController?.text,
        confirmPassword: confirmPasswordController?.text,
        phoneNumber: phoneNoController?.text);
  }

  void goToLogin() {
    Navigator.pop(context);
  }
}
