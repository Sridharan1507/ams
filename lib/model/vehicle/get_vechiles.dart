class GetVehiclesRequestBody {
  String? catCode;
  String? subCatCode;
  String? location;

  GetVehiclesRequestBody({this.catCode, this.subCatCode, this.location});

  GetVehiclesRequestBody.fromJson(Map<String, dynamic> json) {
    catCode = json['cat_code'];
    subCatCode = json['sub_cat_code'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_code'] = this.catCode;
    data['sub_cat_code'] = this.subCatCode;
    data['location'] = this.location;
    return data;
  }
}

class GetAllVehiclesResponse {
  bool? status;
  String? message;
  GetAllVehiclesResponseData? getAllVehiclesResponseData;

  GetAllVehiclesResponse({this.status, this.message, this.getAllVehiclesResponseData});

  GetAllVehiclesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    getAllVehiclesResponseData = json['data'] != null ? new GetAllVehiclesResponseData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.getAllVehiclesResponseData != null) {
      data['data'] = this.getAllVehiclesResponseData!.toJson();
    }
    return data;
  }
}

class GetAllVehiclesResponseData {
  String? imageBasePath;
  List<VechileList>? vechileList;

  GetAllVehiclesResponseData({this.imageBasePath, this.vechileList});

  GetAllVehiclesResponseData.fromJson(Map<String, dynamic> json) {
    imageBasePath = json['image_base_path'];
    if (json['vechile_list'] != null) {
      vechileList = <VechileList>[];
      json['vechile_list'].forEach((v) {
        vechileList!.add(new VechileList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_base_path'] = this.imageBasePath;
    if (this.vechileList != null) {
      data['vechile_list'] = this.vechileList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VechileList {
  String? code;
  String? userCode;
  String? categoryCode;
  String? subCategoryCode;
  String? name;
  String? registerNumber;
  String? engineNumber;
  String? chassisNumber;
  String? radius;
  String? lat;
  String? lng;
  String? amountType;
  String? amount;
  String? vehicleImage;
  String? createdAt;
  String? distance;
  String? activeFlag;

  VechileList(
      {this.code,
      this.userCode,
      this.categoryCode,
      this.subCategoryCode,
      this.name,
      this.registerNumber,
      this.engineNumber,
      this.chassisNumber,
      this.radius,
      this.lat,
      this.lng,
      this.amountType,
      this.amount,
      this.vehicleImage,
      this.createdAt,
      this.distance,
      this.activeFlag});

  VechileList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    userCode = json['user_code'];
    categoryCode = json['category_code'];
    subCategoryCode = json['sub_category_code'];
    name = json['name'];
    registerNumber = json['register_number'];
    engineNumber = json['engine_number'];
    chassisNumber = json['chassis_number'];
    radius = json['radius'];
    lat = json['lat'];
    lng = json['lng'];
    amountType = json['amount_type'];
    amount = json['amount'];
    vehicleImage = json['vehicle_image'];
    createdAt = json['created_at'];
    distance = json['distance'];
    activeFlag = json['active_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['user_code'] = this.userCode;
    data['category_code'] = this.categoryCode;
    data['sub_category_code'] = this.subCategoryCode;
    data['name'] = this.name;
    data['register_number'] = this.registerNumber;
    data['engine_number'] = this.engineNumber;
    data['chassis_number'] = this.chassisNumber;
    data['radius'] = this.radius;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['amount_type'] = this.amountType;
    data['amount'] = this.amount;
    data['vehicle_image'] = this.vehicleImage;
    data['created_at'] = this.createdAt;
    data['distance'] = this.distance;
    data['active_flag'] = this.activeFlag;
    return data;
  }
}