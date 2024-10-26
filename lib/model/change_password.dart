class ChangePasswordRequestBody {
  String? currentPassword;
  String? password;

  ChangePasswordRequestBody({this.currentPassword, this.password});

  ChangePasswordRequestBody.fromJson(Map<String, dynamic> json) {
    currentPassword = json['currentPassword'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPassword'] = this.currentPassword;
    data['password'] = this.password;
    return data;
  }
}

class ChangePasswordResponse {
  bool? status;
  String? message;
  // List<Null>? data;

  ChangePasswordResponse({this.status, this.message, });

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}