import 'dart:convert';
import 'dart:developer';

import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/model/change_password.dart';
import 'package:ams/model/regen_token.dart';
import 'package:ams/model/user_register.dart';

class AuthRepoClass {
  static loginRepo(AuthRequest authrequest) {
    return HttpService(
        url: Constant.getAuth,
        body: authrequest.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
          List<AuthResponseData>? authResponse = (baseResponse.response as List)
              .map((item) => AuthResponseData.fromJson(item))
              .toList();
          log(jsonEncode(authResponse));
          return authResponse;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  static userRegRepo(UserRegisterRequestBody userRegisterRequestBody) {
    return HttpService(
        url: Constant.userRegister,
        body: userRegisterRequestBody.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
          List<AuthResponseData>? authResponse = (baseResponse.response as List)
              .map((item) => AuthResponseData.fromJson(item))
              .toList();
          print(jsonEncode(authResponse));
          return authResponse;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  static changePassword(ChangePasswordRequestBody changePasswordRequest) {
    return HttpService(
        url: Constant.changePassword,
        body: changePasswordRequest.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
          // ChangePasswordResponse changePasswordResponse =
          //     ChangePasswordResponse.fromJson(baseResponse.response);
          print(
              "baseResponse ${baseResponse.message}");

          return baseResponse.message;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }

  static regenToken(RegenTokenRequestBody regenTokenRequestBody) {
    return HttpService(
        url: Constant.regenToken,
        body: regenTokenRequestBody.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }
}
