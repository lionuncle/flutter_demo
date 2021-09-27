import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_demo/models/error_model.dart';
import 'package:flutter_demo/res/strings.dart';
import 'package:flutter_demo/res/toasts.dart';

import 'models.dart';

class MyApi {


  static Future<dynamic> callPostApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.post(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic modelobj =
                await Models.getModelObject(modelName, _response.data);
            if (modelobj.code == 1)
              return modelobj;
            else
              Toasts.getErrorToast(text: modelobj.message);
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse = await Models.getModelObject(
            Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception catch (ex) {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callGetApi(
      {String? url,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.get(url!,
            options: Options(headers: myHeaders), queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic getModelObj =
                await Models.getModelObject(modelName, _response.data);
            if (getModelObj.code == 1)
              return getModelObj;
            else
              Toasts.getErrorToast(text: getModelObj.message);
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: "No internet");
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse = await Models.getModelObject(
            Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception catch (ex) {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return;
    }
  }

  static Future<dynamic> callPutApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.put(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic modelobj =
                await Models.getModelObject(modelName, _response.data);
            if (modelobj.code == 1)
              return modelobj;
            else
              Toasts.getErrorToast(text: modelobj.message);
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse = await Models.getModelObject(
            Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception catch (ex) {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }
}
