class GetUserResponse {
  bool? status;
  String? message;
  List<GetUserResponseData>? getUserResponseData;

  GetUserResponse({this.status, this.message, this.getUserResponseData});

  GetUserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      getUserResponseData = <GetUserResponseData>[];
      json['data'].forEach((v) {
        getUserResponseData!.add(GetUserResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.getUserResponseData != null) {
      data['data'] = this.getUserResponseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetUserResponseData {
  User? user;
  Role? role;

  GetUserResponseData({this.user, this.role});

  GetUserResponseData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
}

class User {
  String? userCode;
  String? name;
  String? userName;
  String? gender;
  String? dob;
  String? mobileNumber;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? activeFlag;
  String? kycVerifiedFlag;
  String? latitude;
  String? longitude;

  User(
      {this.userCode,
      this.name,
      this.userName,
      this.gender,
      this.dob,
      this.mobileNumber,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.activeFlag,
      this.kycVerifiedFlag,
      this.latitude,
      this.longitude});

  User.fromJson(Map<String, dynamic> json) {
    userCode = json['user_code'];
    name = json['name'];
    userName = json['user_name'];
    gender = json['gender'];
    dob = json['dob'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    activeFlag = json['active_flag'];
    kycVerifiedFlag = json['kyc_verified_flag'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_code'] = this.userCode;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active_flag'] = this.activeFlag;
    data['kyc_verified_flag'] = this.kycVerifiedFlag;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Role {
  String? code;
  String? name;

  Role({this.code, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}