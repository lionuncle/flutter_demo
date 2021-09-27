import 'dart:async' show Future;

import 'package:flutter_demo/models/login_model.dart';
import 'package:flutter_demo/models/signup_model.dart';
import 'package:flutter_demo/models/upload_profile_picture_model.dart';
import 'package:flutter_demo/res/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceUtils {
  var time = DateTime;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String? getString(String key, [String? defValue]) {
    if(PreferenceUtils._prefsInstance != null) return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;

    return prefs?.setString(key, value) ?? Future.value(null);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value) ?? Future.value(null);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;

    return prefs?.setInt(key, value) ?? Future.value(null);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance?.getInt(key) ?? defValue ?? 0;
  }

  static Future setUploadImage(UploadProfilePictureResponse uploadProfilePictureResponse) async {

    PreferenceUtils.setString(Strings.filePath, uploadProfilePictureResponse.data!.message!);
  }

  static Future setLoginResponse(LoginResponse loginResponse) async{
    PreferenceUtils.setInt(Strings.loginUserId, loginResponse.data?.userId ?? 0);
    PreferenceUtils.setString(Strings.loginName, loginResponse.data?.name ?? "");
    PreferenceUtils.setString(Strings.loginEmail, loginResponse.data?.email ?? "");
    PreferenceUtils.setString(Strings.loginPhoneNo, loginResponse.data?.phone ?? "");
    PreferenceUtils.setString(Strings.loginPassword, loginResponse.data?.password ?? "");
    PreferenceUtils.setString(Strings.loginProfilePicture, loginResponse.data?.profilePicture ?? "");
    PreferenceUtils.setInt(Strings.loginUserTypeId, loginResponse.data?.userTypeId ?? 0);
    PreferenceUtils.setString(Strings.loginUserType, loginResponse.data?.userType ?? "");
    PreferenceUtils.setString(Strings.loginDeviceId, loginResponse.data?.deviceId ?? "");
  }

  static Future setSignUpResponse(SignUpResponse signUpResponse) async{

    PreferenceUtils.setInt(Strings.signUpUserId, signUpResponse.data?.userId ?? 0);
    PreferenceUtils.setString(Strings.signUpName, signUpResponse.data?.name ?? "");
    PreferenceUtils.setString(Strings.signUpEmail, signUpResponse.data?.email ?? "");
    PreferenceUtils.setString(Strings.signUpPhoneNo, signUpResponse.data?.phone ?? "");
    PreferenceUtils.setString(Strings.signUpPassword, signUpResponse.data?.password ?? "");
    PreferenceUtils.setString(Strings.signUpProfilePicture, signUpResponse.data?.profilePicture ?? "");
    PreferenceUtils.setInt(Strings.signUpUserTypeId, signUpResponse.data?.userTypeId ?? 0);
    PreferenceUtils.setString(Strings.signUpUserType, signUpResponse.data?.userType ?? "");
    PreferenceUtils.setString(Strings.signUpDeviceId, signUpResponse.data?.deviceId ?? "");

  }

  // static Future setEditProfileResponse(EditProfileResponse editProfileResponse) async{
  //
  //   PreferenceUtils.setInt(Strings.editProfileUserId, editProfileResponse.data?.userId ?? 0);
  //   PreferenceUtils.setString(Strings.editProfileName, editProfileResponse.data?.name ?? "");
  //   PreferenceUtils.setString(Strings.editProfileEmail, editProfileResponse.data?.email ?? "");
  //   PreferenceUtils.setString(Strings.editProfilePhoneNo, editProfileResponse.data?.phone ?? "");
  //   PreferenceUtils.setString(Strings.editProfilePassword, editProfileResponse.data?.password ?? "");
  //   PreferenceUtils.setString(Strings.editProfilePicture, editProfileResponse.data?.profilePicture ?? "");
  //   PreferenceUtils.setInt(Strings.editProfileUserTypeId, editProfileResponse.data?.userTypeId ?? 0);
  //   PreferenceUtils.setString(Strings.editProfileUserType, editProfileResponse.data?.userType ?? "");
  //   PreferenceUtils.setString(Strings.editProfileDeviceId, editProfileResponse.data?.deviceId ?? "");
  //
  // }

  // static Future setForgotPasswordResponse(ForgotPasswordResponse forgotPasswordResponse) async {
  //
  //   PreferenceUtils.setInt(Strings.email, forgotPasswordResponse.data.emailId);
  //   PreferenceUtils.setString(Strings.data, forgotPasswordResponse.data.data);
  //   PreferenceUtils.setString(Strings.response, forgotPasswordResponse.data.response);
  //   PreferenceUtils.setString(Strings.createdDate, forgotPasswordResponse.data.createdDate);
  //   PreferenceUtils.setInt(Strings.sentBy, forgotPasswordResponse.data.sentBy);
  //   PreferenceUtils.setInt(Strings.receiver, forgotPasswordResponse.data.reciever);
  // }

  // static Future setUploadImage(UploadImageResponse uploadImageResponse) async {
  //
  //   PreferenceUtils.setString(Strings.filePath, uploadImageResponse.data);
  // }



  // static Future setUpdateProfileResponse(UpdateProfileResponse updateProfileResponse) async {
  //
  //
  //   PreferenceUtils.setInt(Strings.userId, updateProfileResponse.data.user.userId);
  //   PreferenceUtils.setInt(Strings.userTypeId, updateProfileResponse.data.user.userTypeId);
  //   PreferenceUtils.setString(Strings.fullName, updateProfileResponse.data.user.fullName);
  //   PreferenceUtils.setString(Strings.email, updateProfileResponse.data.user.email);
  //   PreferenceUtils.setString(Strings.password, updateProfileResponse.data.user.password);
  //   PreferenceUtils.setString(Strings.location, updateProfileResponse.data.user.location);
  //   PreferenceUtils.setString(Strings.profilePicture, updateProfileResponse.data.user.photo);
  //   PreferenceUtils.setString(Strings.deviceId, updateProfileResponse.data.user.deviceId);
  //   PreferenceUtils.setInt(Strings.subscriptionId, updateProfileResponse.data.user.subscriptionId);
  //
  // }

  // static Future setSaveAppointmentResponse(SaveAppointmentResponse saveAppointmentResponse) async {
  //
  //   PreferenceUtils.setInt(Strings.appointmentId, saveAppointmentResponse.data.appointmentId);
  //   PreferenceUtils.setString(Strings.createdDate, saveAppointmentResponse.data.createdDate);
  //   PreferenceUtils.setBool(Strings.isConfirmed, saveAppointmentResponse.data.isConfirmed);
  // }

  static clearPreferences() {
     _prefsInstance?.clear();
  }


}

