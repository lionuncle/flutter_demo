import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/models/GetHomeResponse.dart';
import 'package:flutter_demo/network/API.dart';
import 'package:flutter_demo/network/api_url.dart';
import 'package:flutter_demo/network/models.dart';
class HomeProvider extends ChangeNotifier {
  BuildContext? context;
  GetHomeResponse? getHomeResponse;
  bool isAdsFetched = false;

  Future<void> init({@required BuildContext? context}) async {
    isAdsFetched = false;
    this.context = context;
    await getHomeData();
  }

  Future<void> getHomeData() async {
    try {
      Map<String, dynamic> headers = {"Content-Type": "application/json"};

      getHomeResponse = await MyApi.callGetApi(
          url: homeApiUrl, myHeaders: headers, modelName: Models.homeModel);
      if (getHomeResponse != null) {
        isAdsFetched = true;
        print('Task Approved');
        notifyListeners();
      }
    } catch (ex) {
      print(ex);
    }
  }


}
