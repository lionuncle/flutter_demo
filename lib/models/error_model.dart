class ErrorResponse {
  String? message;
  int? code;
  Data? data;

  ErrorResponse({this.message, this.code, this.data});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
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
  String? message;

  Data({this.message});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    return data;
  }
}
