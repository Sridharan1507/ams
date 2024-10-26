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