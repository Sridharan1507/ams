
class VehicleSubCatRespose {
  bool? status;
  String? message;
  List<VehicleSubCatResponseData>? vehicleSubCatResponseData;

  VehicleSubCatRespose({this.status, this.message, this.vehicleSubCatResponseData});

  VehicleSubCatRespose.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      vehicleSubCatResponseData = <VehicleSubCatResponseData>[];
      json['data'].forEach((v) {
        vehicleSubCatResponseData!.add(new VehicleSubCatResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.vehicleSubCatResponseData != null) {
      data['data'] = this.vehicleSubCatResponseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VehicleSubCatResponseData {
  String? id;
  String? categoryId;
  String? code;
  String? name;
  String? description;
  String? createdAt;
  String? activeFlag;

  VehicleSubCatResponseData(
      {this.id,
      this.categoryId,
      this.code,
      this.name,
      this.description,
      this.createdAt,
      this.activeFlag});

  VehicleSubCatResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    activeFlag = json['active_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['active_flag'] = this.activeFlag;
    return data;
  }
}

