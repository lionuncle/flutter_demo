import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/models/GetHomeResponse.dart';
import 'package:flutter_demo/models/error_model.dart';
import 'package:flutter_demo/models/login_model.dart';
import 'package:flutter_demo/models/signup_model.dart';

class Models {
  static const String SIGNUP_MODEL_NAME = "SIGN_UP_MODEL";
  static const String loginModel = "LOGIN_MODEL";
  static const String signupModel = "SIGNUP_MODEL";
  static const String forgotPasswordModel = "FORGOT_PASSWORD_MODEL";
  static const String editProfileModel = "EDIT_PROFILE_MODEL";
  static const String errorModel = "ERROR_MODEL";
  static const String uploadProfilePictureModel = "UPLOAD_PROFILE_PICTURE_MODEL";
  static const String getFeaturesModel = "GET_FEATURES_MODEL";
  static const String saveFeaturesModel = "SAVE_FEATURES_MODEL";
  static const String homeModel = "Home Model";
  static const String offersModel = "Offers Model";
  static const String subscriptionModel = "Subscription Model";
  static const String vouchersModel = "Vouchers Model";
  static const String bookingModel = "Booking Model";
  static const String notificationModel = "Notification Model";
  static const String workSpaceModel = "WorkSpace Model";
  static const String walletModel = "GET_WALLET_MODEL";
  static const String myBookingsModel = "GET_MY_BOOKINGS_MODEL";
  static const String bookingDetailModel = "BOOKING_DETAIL_MODEL";
  static const String scheduleBookingModel = "Schedule_Booking_Model";
  static const String availableSlotsModel = "Available_Slots_Model";
  static const String eventsModel = "Events_Model";
  static const String categoriesModel = "Categories_Model";

  //// Mark: Tayyab - Rate Business
  static const String rateBusinessDetailModel = "RATE_BUSINESS";


  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case homeModel:
        return GetHomeResponse.fromJson(json);
      case loginModel:
        return LoginResponse.fromJson(json);
      case signupModel:
        return SignUpResponse.fromJson(json);
      case errorModel:
        return ErrorResponse.fromJson(json);
    }
  }
}
