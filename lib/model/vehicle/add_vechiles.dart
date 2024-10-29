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