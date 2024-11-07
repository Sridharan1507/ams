class AddVehicleRequestBody {
  int? subCatId;
  String? vehicleName;
  String? registrationNumber;
  String? engineNumber;
  String? chassisNumber;
  int? radius;
  double? lat;
  double? lng;
  double? amount;
  String? amountType;
  int? availabilityFlag;

  AddVehicleRequestBody(
      {this.subCatId,
      this.vehicleName,
      this.registrationNumber,
      this.engineNumber,
      this.chassisNumber,
      this.radius,
      this.lat,
      this.lng,
      this.amount,
      this.amountType,
      this.availabilityFlag});

  AddVehicleRequestBody.fromJson(Map<String, dynamic> json) {
    subCatId = json['sub_cat_id'];
    vehicleName = json['vehicle_name'];
    registrationNumber = json['registration_number'];
    engineNumber = json['engine_number'];
    chassisNumber = json['chassis_number'];
    radius = json['radius'];
    lat = json['lat'];
    lng = json['lng'];
    amount = json['amount'];
    amountType = json['amount_type'];
    availabilityFlag = json['availability_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_cat_id'] = this.subCatId;
    data['vehicle_name'] = this.vehicleName;
    data['registration_number'] = this.registrationNumber;
    data['engine_number'] = this.engineNumber;
    data['chassis_number'] = this.chassisNumber;
    data['radius'] = this.radius;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['amount'] = this.amount;
    data['amount_type'] = this.amountType;
    data['availability_flag'] = this.availabilityFlag;
    return data;
  }
}

class AddVehicleResponse {
  bool? status;
  String? message;
  List<AddVehicleResponseData>? addVehicleResponse;

  AddVehicleResponse({this.status, this.message, this.addVehicleResponse});

  AddVehicleResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      addVehicleResponse = <AddVehicleResponseData>[];
      json['data'].forEach((v) {
        addVehicleResponse!.add(new AddVehicleResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.addVehicleResponse != null) {
      data['data'] = this.addVehicleResponse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddVehicleResponseData {
  int? entiry;

  AddVehicleResponseData({this.entiry});

  AddVehicleResponseData.fromJson(Map<String, dynamic> json) {
    entiry = json['entiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entiry'] = this.entiry;
    return data;
  }
}

class MyVechilesResponse {
  bool? status;
  String? message;
  List<MyvehilcesResponseData>? data;

  MyVechilesResponse({this.status, this.message, this.data});

  MyVechilesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MyvehilcesResponseData>[];
      json['data'].forEach((v) {
        data!.add(new MyvehilcesResponseData.fromJson(v));
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

class MyvehilcesResponseData {
  String? id;
  String? userId;
  String? subCatId;
  String? code;
  String? vehicleName;
  String? registrationNumber;
  String? engineNumber;
  String? chassisNumber;
  String? radius;
  String? lat;
  String? lng;
  Null? vehicleImage;
  String? availabilityFlag;
  String? createdAt;
  String? updatedAt;
  String? activeFlag;
  String? amount;
  String? amountType;

  MyvehilcesResponseData(
      {this.id,
      this.userId,
      this.subCatId,
      this.code,
      this.vehicleName,
      this.registrationNumber,
      this.engineNumber,
      this.chassisNumber,
      this.radius,
      this.lat,
      this.lng,
      this.vehicleImage,
      this.availabilityFlag,
      this.createdAt,
      this.updatedAt,
      this.activeFlag,
      this.amount,
      this.amountType});

  MyvehilcesResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    subCatId = json['sub_cat_id'];
    code = json['code'];
    vehicleName = json['vehicle_name'];
    registrationNumber = json['registration_number'];
    engineNumber = json['engine_number'];
    chassisNumber = json['chassis_number'];
    radius = json['radius'];
    lat = json['lat'];
    lng = json['lng'];
    vehicleImage = json['vehicle_image'];
    availabilityFlag = json['availability_flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    activeFlag = json['active_flag'];
    amount = json['amount'];
    amountType = json['amount_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['sub_cat_id'] = this.subCatId;
    data['code'] = this.code;
    data['vehicle_name'] = this.vehicleName;
    data['registration_number'] = this.registrationNumber;
    data['engine_number'] = this.engineNumber;
    data['chassis_number'] = this.chassisNumber;
    data['radius'] = this.radius;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['vehicle_image'] = this.vehicleImage;
    data['availability_flag'] = this.availabilityFlag;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active_flag'] = this.activeFlag;
    data['amount'] = this.amount;
    data['amount_type'] = this.amountType;
    return data;
  }
}

class GetEnquiresListResponse {
  bool? status;
  String? message;
  List<GetEnquiresListResponseData>? data;

  GetEnquiresListResponse({this.status, this.message, this.data});

  GetEnquiresListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetEnquiresListResponseData>[];
      json['data'].forEach((v) {
        data!.add(new GetEnquiresListResponseData.fromJson(v));
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

class GetEnquiresListResponseData {
  String? id;
  String? userCode;
  String? vehicleCode;
  String? toUserCode;
  String? status;
  String? createdAt;
  String? ownerName;
  String? mobileNumber;
  String? email;
  String? userId;
  String? subCatId;
  String? code;
  String? vehicleName;
  String? registrationNumber;
  String? engineNumber;
  String? chassisNumber;
  String? radius;
  String? lat;
  String? lng;
  Null? vehicleImage;
  String? availabilityFlag;
  String? updatedAt;
  String? activeFlag;
  String? amount;
  String? amountType;

  GetEnquiresListResponseData(
      {this.id,
      this.userCode,
      this.vehicleCode,
      this.toUserCode,
      this.status,
      this.createdAt,
      this.ownerName,
      this.mobileNumber,
      this.email,
      this.userId,
      this.subCatId,
      this.code,
      this.vehicleName,
      this.registrationNumber,
      this.engineNumber,
      this.chassisNumber,
      this.radius,
      this.lat,
      this.lng,
      this.vehicleImage,
      this.availabilityFlag,
      this.updatedAt,
      this.activeFlag,
      this.amount,
      this.amountType});

  GetEnquiresListResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userCode = json['user_code'];
    vehicleCode = json['vehicle_code'];
    toUserCode = json['to_user_code'];
    status = json['status'];
    createdAt = json['created_at'];
    ownerName = json['ownerName'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    userId = json['user_id'];
    subCatId = json['sub_cat_id'];
    code = json['code'];
    vehicleName = json['vehicle_name'];
    registrationNumber = json['registration_number'];
    engineNumber = json['engine_number'];
    chassisNumber = json['chassis_number'];
    radius = json['radius'];
    lat = json['lat'];
    lng = json['lng'];
    vehicleImage = json['vehicle_image'];
    availabilityFlag = json['availability_flag'];
    updatedAt = json['updated_at'];
    activeFlag = json['active_flag'];
    amount = json['amount'];
    amountType = json['amount_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_code'] = this.userCode;
    data['vehicle_code'] = this.vehicleCode;
    data['to_user_code'] = this.toUserCode;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['ownerName'] = this.ownerName;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    data['user_id'] = this.userId;
    data['sub_cat_id'] = this.subCatId;
    data['code'] = this.code;
    data['vehicle_name'] = this.vehicleName;
    data['registration_number'] = this.registrationNumber;
    data['engine_number'] = this.engineNumber;
    data['chassis_number'] = this.chassisNumber;
    data['radius'] = this.radius;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['vehicle_image'] = this.vehicleImage;
    data['availability_flag'] = this.availabilityFlag;
    data['updated_at'] = this.updatedAt;
    data['active_flag'] = this.activeFlag;
    data['amount'] = this.amount;
    data['amount_type'] = this.amountType;
    return data;
  }
}