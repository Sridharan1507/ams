import 'dart:convert';
import 'dart:developer';

import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/vehicle/add_vechiles.dart';
import 'package:ams/model/vehicle/get_vechiles.dart';
import 'package:ams/model/vehicle/vehicle_cat.dart';
import 'package:ams/model/vehicle/vehicle_sub_cat.dart';

class VehicleRepo {
  static getAllVehicles(GetVehiclesRequestBody getVehiclesRequestBody) {
    return HttpService(
        url: Constant.getvehicles,
        body: getVehiclesRequestBody.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
          GetAllVehiclesResponseData? getAllVehiclesResponseData =
              GetAllVehiclesResponseData.fromJson(baseResponse.response);
          return getAllVehiclesResponseData;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  static getvehicleCategory() {
    return HttpService(
        url: Constant.getvehicleCategory,
        parse: (response) {
          BaseResponse baseResponse = response;
            List<VehicleCatResposeData>? vehicleCatResponseData =
              (baseResponse.response as List)
                  .map((item) => VehicleCatResposeData.fromJson(item))
                  .toList();
          log(jsonEncode(vehicleCatResponseData));
          return vehicleCatResponseData;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  static getvehicleSubCategory() {
    return HttpService(
        url: Constant.getvehicleSubCategory,
        parse: (response) {
          BaseResponse baseResponse = response;

          List<VehicleSubCatResponseData>? vehicleSubCatResponseData =
              (baseResponse.response as List)
                  .map((item) => VehicleSubCatResponseData.fromJson(item))
                  .toList();
          log(jsonEncode(vehicleSubCatResponseData));
          return vehicleSubCatResponseData;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  static addVehicle(AddVehicleRequestBody addVehicleRequestBody) {
    return HttpService(
        url: Constant.addVechile,
        body: addVehicleRequestBody.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
          List<AddVehicleResponseData>? addVehicleResponse =
              (baseResponse.response as List)
                  .map((item) => AddVehicleResponseData.fromJson(item))
                  .toList();
          log(jsonEncode(addVehicleResponse));
          return addVehicleResponse;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

    static getMyVehicles() {
    return HttpService(
        url: Constant.getMyvechiles,
        parse: (response) {
          BaseResponse baseResponse = response;
          List<MyvehilcesResponseData>? myvehicles =
              (baseResponse.response as List)
                  .map((item) => MyvehilcesResponseData.fromJson(item))
                  .toList();
          log(jsonEncode(myvehicles));
          return myvehicles;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

    static enquiresList() {
    return HttpService(
        url: Constant.getEnquiries,
        parse: (response) {
          BaseResponse baseResponse = response;
          List<GetEnquiresListResponseData>? getenquiries =
              (baseResponse.response as List)
                  .map((item) => GetEnquiresListResponseData.fromJson(item))
                  .toList();
          log(jsonEncode(getenquiries));
          return getenquiries;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }
}
