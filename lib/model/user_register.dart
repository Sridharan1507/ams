class UserRegisterRequestBody {
  String? name;
  String? userName;
  String? password;
  String? gender;
  String? dob;
  String? mobileNumber;
  String? email;
  String? latitude;
  String? longitude;
  String? deviceToken;

  UserRegisterRequestBody(
      {this.name,
      this.userName,
      this.password,
      this.gender,
      this.dob,
      this.mobileNumber,
      this.email,
      this.latitude,
      this.longitude,
      this.deviceToken});

  UserRegisterRequestBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userName = json['user_name'];
    password = json['password'];
    gender = json['gender'];
    dob = json['dob'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    deviceToken = json['device_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['device_token'] = this.deviceToken;
    return data;
  }
}