// To parse this JSON data, do
//
//     final servicelist = servicelistFromJson(jsonString);

import 'dart:convert';

List<Servicelist> servicelistFromJson(List str) => List<Servicelist>.from(str.map((x) => Servicelist.fromJson(x)));

String servicelistToJson(List<Servicelist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Servicelist {
  String id;
  String serviceCategoryId;
  String name;
  String? desc;
  String activeFlag;

  Servicelist({
    required this.id,
    required this.serviceCategoryId,
    required this.name,
    required this.desc,
    required this.activeFlag,
  });

  factory Servicelist.fromJson(Map<String, dynamic> json) => Servicelist(
    id: json["id"],
    serviceCategoryId: json["service_category_id"],
    name: json["name"],
    desc: json["desc"],
    activeFlag: json["active_flag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_category_id": serviceCategoryId,
    "name": name,
    "desc": desc,
    "active_flag": activeFlag,
  };
}
