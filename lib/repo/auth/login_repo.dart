import 'dart:convert';
import 'dart:developer';

import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/auth_respose.dart';
import 'package:ams/model/change_password.dart';
import 'package:ams/model/regen_token.dart';

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

  static changePassword(ChangePasswordRequestBody changePasswordRequest) {
    return HttpService(
        url: Constant.changePassword,
        body: changePasswordRequest.toJson(),
        parse: (response) {
          BaseResponse baseResponse = response;
        
        },
        errparse: (response) {
          ErrResponse errResponse = response;

          return errResponse;
        });
  }
  static regenToken(RegenTokenRequestBody regenTokenRequestBody) {
    return HttpService(
        url: Constant.changePassword,
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

  

