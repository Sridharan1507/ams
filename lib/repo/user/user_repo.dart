
import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';

class UserRepo {
  static getUser() {
    return HttpService(
        url: Constant.getUser,
        parse: (response) {
          BaseResponse baseResponse = response;
         
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  static getAllUsers() {
    return HttpService(
        url: Constant.getAllUsers,
        parse: (response) {
          BaseResponse baseResponse = response;
         
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  
}