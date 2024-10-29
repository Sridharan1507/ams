
import 'dart:convert';
import 'dart:developer';

import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/get_user.dart';

class UserRepo {
  static getUser() {
    return HttpService(
        url: Constant.getUser,
        parse: (response) {
          BaseResponse baseResponse = response;
          List<GetUserResponseData>? getUserResponseData=(baseResponse.response as List)
              .map((item) => GetUserResponseData.fromJson(item))
              .toList();
          log(jsonEncode(getUserResponseData));
          return getUserResponseData;
         
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