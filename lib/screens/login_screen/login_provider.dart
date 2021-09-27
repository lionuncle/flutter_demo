
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/animations/slide_right.dart';
import 'package:flutter_demo/common/utils.dart';
import 'package:flutter_demo/models/login_model.dart';
import 'package:flutter_demo/network/API.dart';
import 'package:flutter_demo/network/api_url.dart';
import 'package:flutter_demo/network/models.dart';
import 'package:flutter_demo/res/toasts.dart';
import 'package:flutter_demo/screens/home/home.dart';
import 'package:flutter_demo/widgets/loader.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext? context;

  var dio = Dio();
  LoginResponse loginResponse = LoginResponse();
  Loader _loader = Loader();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
  }

  Future<void> loginApi(
      {@required String? email, @required String? password}) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};

      Map<String, dynamic> body = {
        "Email": email,
        "Password": password,
        "DeviceId": "1122"
      };

      loginResponse = await MyApi.callPostApi(
          url: loginApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.loginModel);

      if(loginResponse != null) {
        await PreferenceUtils.setLoginResponse(loginResponse).then((_){
          Toasts.getSuccessToast(text: "Login Successful");
          _loader.hideLoader(context!);
          Navigator.push(context!, SlideRightRoute(page: Home()));

        });
      }
      else {
        _loader.hideLoader(context!);
      }

    } catch (e) {
      _loader.hideLoader(context!);
      print(e.toString());
      //Toasts.getErrorToast(text: loginResponse.message);
    }
  }

  Future<void> callLoginApi(
      {@required String? email, @required String? password}) async {
    if (email != null && password != null) {
      if (email.isNotEmpty && password.isNotEmpty) {
        loginApi(email: email, password: password);
      } else if (email.isEmpty && password.isEmpty) {
        Toasts.getErrorToast(text: "Email and Password Missing");
      } else if (email.isEmpty) {
        Toasts.getErrorToast(text: "Email Missing");
      } else if (password.isEmpty) {
        Toasts.getErrorToast(text: "Password  missing");
      }
    } else {
      Toasts.getErrorToast(text: "Invalid email or password");
    }
  }
}
