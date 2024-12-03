import 'dart:convert';

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
// To parse this JSON data, do
//
//     final userstore = userstoreFromJson(jsonString);



Userstore userstoreFromJson(String str) => Userstore.fromJson(json.decode(str));

String userstoreToJson(Userstore data) => json.encode(data.toJson());

class Userstore {
  String name;
  String userName;
  String password;
  String gender;
  DateTime dob;
  String mobileNumber;
  String email;
  String deviceToken;
  List<Store> store;

  Userstore({
    required this.name,
    required this.userName,
    required this.password,
    required this.gender,
    required this.dob,
    required this.mobileNumber,
    required this.email,
    required this.deviceToken,
    required this.store,
  });

  factory Userstore.fromJson(Map<String, dynamic> json) => Userstore(
    name: json["name"],
    userName: json["user_name"],
    password: json["password"],
    gender: json["gender"],
    dob: DateTime.parse(json["dob"]),
    mobileNumber: json["mobile_number"],
    email: json["email"],
    deviceToken: json["device_token"],
    store: List<Store>.from(json["store"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "user_name": userName,
    "password": password,
    "gender": gender,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "mobile_number": mobileNumber,
    "email": email,
    "device_token": deviceToken,
    "store": List<dynamic>.from(store.map((x) => x.toJson())),
  };
}

class Store {
  String storeName;
  int categoryId;
  String services;
  String address;
  String city;
  String state;
  int pincode;
  String aadharNumber;
  String coords;

  Store({
    required this.storeName,
    required this.categoryId,
    required this.services,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.aadharNumber,
    required this.coords,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    storeName: json["store_name"],
    categoryId: json["category_id"],
    services: json["services"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    aadharNumber: json["aadhar_number"],
    coords: json["coords"],
  );

  Map<String, dynamic> toJson() => {
    "store_name": storeName,
    "category_id": categoryId,
    "services": services,
    "address": address,
    "city": city,
    "state": state,
    "pincode": pincode,
    "aadhar_number": aadharNumber,
    "coords": coords,
  };
}
