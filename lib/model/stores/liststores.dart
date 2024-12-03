// To parse this JSON data, do
//
//     final storeList = storeListFromJson(jsonString);

import 'dart:convert';

StoreList storeListFromJson(Map<String, dynamic> str) => StoreList.fromJson(str);

String storeListToJson(StoreList data) => json.encode(data.toJson());

class StoreList {
  String imageUrl;
  List<Store> stores;

  StoreList({
    required this.imageUrl,
    required this.stores,
  });

  factory StoreList.fromJson(Map<String, dynamic> json) => StoreList(
    imageUrl: json["image_url"],
    stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
  };
}

class Store {
  String id;
  String userId;
  String contactPerson;
  String storeName;
  String categoryName;
  String categoryId;
  String services;
  String address;
  String city;
  String state;
  String pincode;
  String aadharNumber;
  String profileImage;
  String lat;
  String lng;
  String distance;
  DateTime createdAt;
  String activeFlag;

  Store({
    required this.id,
    required this.userId,
    required this.contactPerson,
    required this.storeName,
    required this.categoryName,
    required this.categoryId,
    required this.services,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.aadharNumber,
    required this.profileImage,
    required this.lat,
    required this.lng,
    required this.distance,
    required this.createdAt,
    required this.activeFlag,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    userId: json["user_id"],
    contactPerson: json["contact_person"],
    storeName: json["store_name"],
    categoryName: json["category_name"],
    categoryId: json["category_id"],
    services: json["services"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    aadharNumber: json["aadhar_number"],
    profileImage: json["profile_image"]??'',
    lat: json["lat"],
    lng: json["lng"],
    distance: json["distance"],
    createdAt: DateTime.parse(json["created_at"]),
    activeFlag: json["active_flag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "contact_person": contactPerson,
    "store_name": storeName,
    "category_name": categoryName,
    "category_id": categoryId,
    "services": services,
    "address": address,
    "city": city,
    "state": state,
    "pincode": pincode,
    "aadhar_number": aadharNumber,
    "profile_image": profileImage,
    "lat": lat,
    "lng": lng,
    "distance": distance,
    "created_at": createdAt.toIso8601String(),
    "active_flag": activeFlag,
  };
}
