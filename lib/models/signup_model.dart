class SignUpResponse {
  String? message;
  int? code;
  Data? data;

  SignUpResponse({this.message, this.code, this.data});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    code = json['Code'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Code'] = this.code;
    if (this.data != null) {
      data['Data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  int? userId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? profilePicture;
  int? userTypeId;
  String? userType;
  String? deviceId;

  Data(
      {this.userId,
        this.name,
        this.email,
        this.phone,
        this.password,
        this.profilePicture,
        this.userTypeId,
        this.userType,
        this.deviceId});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
    password = json['Password'];
    profilePicture = json['ProfilePicture'];
    userTypeId = json['UserTypeId'];
    userType = json['UserType'];
    deviceId = json['DeviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['Password'] = this.password;
    data['ProfilePicture'] = this.profilePicture;
    data['UserTypeId'] = this.userTypeId;
    data['UserType'] = this.userType;
    data['DeviceId'] = this.deviceId;
    return data;
  }
}
