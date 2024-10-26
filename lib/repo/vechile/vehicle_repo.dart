
import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/vehicle/get_vechiles.dart';

class VehicleRepo {
  static getAllVehicles(GetVehiclesRequestBody getVehiclesRequestBody) {
    return HttpService(
        url: Constant.getvehicles,
        body: getVehiclesRequestBody.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
         
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
         
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }


  
}