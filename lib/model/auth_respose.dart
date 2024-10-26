class AuthResponse {
  bool? status;
  String? message;
  List<AuthResponseData>? data;

  AuthResponse({this.status, this.message, this.data});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AuthResponseData>[];
      json['data'].forEach((v) {
        data!.add(new AuthResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AuthResponseData {
  String? accessToken;
  String? sessionToken;

  AuthResponseData({this.accessToken, this.sessionToken});

  AuthResponseData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    sessionToken = json['sessionToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['sessionToken'] = this.sessionToken;
    return data;
  }
}

class AuthRequest {
  String? userName;
  String? password;

  AuthRequest({this.userName, this.password});

  AuthRequest.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}