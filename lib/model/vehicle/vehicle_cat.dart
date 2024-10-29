class VehicleCatRespose {
  bool? status;
  String? message;
  List<VehicleCatResposeData>? vehicleCatResposeData;

  VehicleCatRespose({this.status, this.message, this.vehicleCatResposeData});

  VehicleCatRespose.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      vehicleCatResposeData = <VehicleCatResposeData>[];
      json['data'].forEach((v) {
        vehicleCatResposeData!.add(new VehicleCatResposeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.vehicleCatResposeData != null) {
      data['data'] = this.vehicleCatResposeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleCatResposeData {
  String? id;
  String? code;
  String? name;
  String? description;
  String? createdAt;
  String? activeFlag;

  VehicleCatResposeData(
      {this.id,
      this.code,
      this.name,
      this.description,
      this.createdAt,
      this.activeFlag});

  VehicleCatResposeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    activeFlag = json['active_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['active_flag'] = this.activeFlag;
    return data;
  }
}