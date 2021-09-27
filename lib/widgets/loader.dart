import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/res/assets.dart';
import 'package:flutter_demo/res/res.dart';
import 'package:lottie/lottie.dart';

class Loader {
  showLoader({
    BuildContext ? context,
  }) {
    showDialog(
      context: context!,
      builder: (_) {
        return Material(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: Container(
              height: sizes!.height *0.35,
              width: sizes!.width *0.35,
              child: Lottie.asset(Assets.apiLoading),            ),
          ),
        );
      },
    );
  }

hideLoader(BuildContext context) {
    Navigator.of(context).pop();
  }


}


