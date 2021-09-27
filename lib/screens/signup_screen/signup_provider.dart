import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/common/utils.dart';
import 'package:flutter_demo/models/signup_model.dart';
import 'package:flutter_demo/models/upload_profile_picture_model.dart';
import 'package:flutter_demo/network/API.dart';
import 'package:flutter_demo/network/api_url.dart';
import 'package:flutter_demo/network/models.dart';
import 'package:flutter_demo/res/toasts.dart';
import 'package:flutter_demo/widgets/loader.dart';
import 'package:connectivity/connectivity.dart';

class SignupProvider extends ChangeNotifier {
  BuildContext? context;
  var dio = Dio();
  Loader loader = Loader();
  bool pickedImage = false;
  File? myImage;

  SignUpResponse signUpResponse = SignUpResponse();
  UploadProfilePictureResponse uploadProfilePictureResponse =
      UploadProfilePictureResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> uploadImageApi(
      {@required dynamic image, @required int? userId}) async {
    try {
      Map<String, dynamic> header = {"accept": "*/*"};

      String filename = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        "filePath": await MultipartFile.fromFile(
          image.path,
          filename: filename,
        ),
        "id": userId,
      });

      uploadProfilePictureResponse = await MyApi.callPostApi(
          url: uploadProfilePictureApiUrl,
          body: formData,
          myHeaders: header,
          modelName: Models.uploadProfilePictureModel);

      if (uploadProfilePictureResponse != null) {
        await PreferenceUtils.setUploadImage(uploadProfilePictureResponse)
            .then((_) {
          Toasts.getWarningToast(text: "Image Uploaded");
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUpApi({
    @required String? name,
    @required String? email,
    @required String? password,
    @required String? confirmPassword,
    @required String? phoneNumber,
  }) async {
    try {
      loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      Map<String, dynamic> body = {
        "Name": name,
        "Email": email,
        "Password": password,
        "Phone": phoneNumber,
        "DeviceId": "1122",
      };

      signUpResponse = await MyApi.callPostApi(
          url: signUpApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.signupModel);

      if (signUpResponse != null) {
        await PreferenceUtils.setSignUpResponse(signUpResponse).then((_) async {
          if (pickedImage) {
            await uploadImageApi(
                image: myImage, userId: signUpResponse.data?.userId);
            pickedImage = false;
          }
          loader.hideLoader(context!);
          Toasts.getSuccessToast(text: "Signup Successful");
          navigate(userType: signUpResponse.data?.userType);
        });
      } else
        loader.hideLoader(context!);
    } catch (e) {
      loader.hideLoader(context!);
      print(e.toString());
      //Toasts.getErrorToast(text: e.toString());
    }
  }

  Future<void> callSignUpApi({
    @required String? name,
    @required String? email,
    @required String? password,
    @required String? confirmPassword,
    @required String? phoneNumber,
  }) async {
    if (name!.isNotEmpty &&
        email!.isNotEmpty &&
        password!.isNotEmpty &&
        confirmPassword!.isNotEmpty &&
        password == confirmPassword &&
        phoneNumber!.isNotEmpty) {
      signUpApi(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
      );
    } else if (name.isEmpty) {
      Toasts.getErrorToast(text: "Enter Full Name");
    } else if ((email!.isEmpty)) {
      Toasts.getErrorToast(text: "Enter Email");
    } else if (password!.isEmpty) {
      Toasts.getErrorToast(text: "Enter Password");
    } else if (confirmPassword!.isEmpty) {
      Toasts.getErrorToast(text: "Confirm password empty");
    } else if (password != confirmPassword) {
      Toasts.getErrorToast(text: "Confirm password doesn't match");
    } else if (phoneNumber!.isEmpty) {
      Toasts.getErrorToast(text: "Enter phone number");
    }
  }

  Future<void> navigate({@required String? userType}) async {
    if (userType == "User" || userType == "user") {
      Navigator.pop(context!);
      print(signUpResponse.message);
    }
  }
}
