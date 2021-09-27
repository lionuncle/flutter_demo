import 'package:flutter/material.dart';
import 'package:flutter_demo/res/res.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Toasts {

  static getErrorToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0
    );
  }

  static getSuccessToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0
    );
  }

  static getWarningToast({@required String? text}) async {

    await Fluttertoast.showToast(
        msg: text ?? "please try again",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: sizes!.fontRatio * 16.0
    );
  }

}