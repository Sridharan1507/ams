import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ams/constant.dart';
import 'package:ams/model/regen_token.dart';
import 'package:ams/repo/auth/login_repo.dart';
import 'package:ams/shared_preference.dart';
import 'package:http/http.dart' as http;

String token = '';

class HttpService<T> {
  final String? url;
  final dynamic body;
  final List<File>? files;
  T Function(BaseResponse response)? parse;
  T Function(ErrResponse response)? errparse;

  HttpService({this.url, this.body, this.parse, this.errparse, this.files});
}

class APIWeb {
  static authenticateUrl(String url) async {

    String sessionToken = await SharedPreference.getSessionToken();
    print("session token before $sessionToken");
    if (url != Constant.getAuth && url != Constant.userRegister) {  

      RegenTokenRequestBody regenTokenRequestBody =
          RegenTokenRequestBody(sessionToken: sessionToken);
      final data =
          await APIWeb().post(AuthRepoClass.regenToken(regenTokenRequestBody));
      String authToken = data.authResponse![0].accessToken.toString();
      sessionToken = data.authResponse![0].sessionToken.toString();
      await SharedPreference.saveAuthToken(authToken);
      await SharedPreference.saveSessionToken(sessionToken);
    }
    print("URL IS $url");

    print("session token after $sessionToken");

    return url;
  }

  Future<T> get<T>(HttpService<T> resource) async {
    String token = await SharedPreference.getAuthToken();
    print("token $token");
    Map<String, String> headers = {};

    // String processedUrl = await authenticateUrl(resource.url!);
String processedUrl = resource.url!;
 log("processed Url $processedUrl");
    if (processedUrl.isNotEmpty) {
      if (processedUrl != Constant.getAuth ||
          processedUrl != Constant.regenToken) {
        headers = {"localtonet-skip-warning": "true", "Token": token};
      } else {
        headers = {"localtonet-skip-warning": "true"};
      }

      final uri = Uri.parse(processedUrl);

      final response = await http.get(uri, headers: headers);
      log("url $uri");
      log("full json ${response.body}");
      if (response.statusCode == 100) {
        return buildTokenExpiredNavigator(resource);
      } else if (response.statusCode == 200|| response.statusCode == 401) {
        var responseJson = json.decode(response.body);
        dynamic res;
        if (responseJson['status'] == true) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == false) {
            res = resource.errparse!(ErrResponse.fromJSON(responseJson));
        }

        return res;
      } else {
         dynamic res;
        var responseJson = json.decode(response.body);
        if (responseJson['status'] == false) {
            res = resource.errparse!(ErrResponse.fromJSON(responseJson));
        }
         return res;
        // throw Exception(response.statusCode);
      }
    } else {
      return buildTokenExpiredErrorResponse(resource);
    }
  }

  Future<T> post<T>(HttpService<T> resource) async {
  String token = await SharedPreference.getAuthToken();
   print("token $token");
    Map<String, String> headers = {};

    // String processedUrl = await authenticateUrl(resource.url!);
String processedUrl = resource.url!;
    if (processedUrl.isNotEmpty) {
      if (processedUrl != Constant.getAuth ||
          processedUrl != Constant.regenToken) {
        headers = {"localtonet-skip-warning": "true", "Token": token};
      } else {
        headers = {"localtonet-skip-warning": "true"};
      }
      final uri = Uri.parse(processedUrl);
      final response = await http.post(uri,
          body: jsonEncode(resource.body), headers: headers);
      log("url $uri");
      log("response code ${token}");
      log("response body ${response.body}");
      if (response.statusCode == 100) {
        return buildTokenExpiredNavigator(resource);
      } else if (response.statusCode == 200 || response.statusCode == 401) {
        dynamic res;
        var responseJson = json.decode(response.body);
        if (responseJson['data'] == null && responseJson['status'] == true) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == true) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == null) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == false) {
          res = resource.errparse!(ErrResponse.fromJSON(responseJson));
        }
        return res;
      }
       else {
         dynamic res;
        var responseJson = json.decode(response.body);
        if (responseJson['status'] == false) {
          res = resource.errparse!(ErrResponse.fromJSON(responseJson));
        }
        return res;
        // throw Exception(response.statusCode);
      }
    } else {
      return buildTokenExpiredErrorResponse(resource);
    }
  }

  buildTokenExpiredNavigator(dynamic resource) {}

  buildTokenExpiredErrorResponse(dynamic resource) {
    return resource.errparse!(ErrResponse(
      status: 0,
      message: "Session expired, Please login again to continue.",
    ));
  }
}

class BaseResponse {
  final dynamic status;
  final dynamic message;
  final dynamic response;

  BaseResponse({this.status, this.message, this.response});

  //mapping json data
  factory BaseResponse.fromJSON(Map<String, dynamic> jsonMap) {
    var list = jsonMap["data"] as dynamic;
    final data = BaseResponse(
        status: jsonMap["status"],
        message: jsonMap["message"],
        response: jsonMap["data"] != null ? list : []);
    return data;
  }

  @override
  String toString() {
    return 'BaseResponse{status: $status, datetime: $message, response: $response}';
  }
}

class ErrResponse {
  final dynamic status;
  final String? message;
  final dynamic data;

  ErrResponse({this.status, this.message, this.data});

  //mapping json data
  factory ErrResponse.fromJSON(Map<String, dynamic> jsonMap) {
    final data = ErrResponse(
      status: jsonMap["status"],
      message: jsonMap["message"],
      data: jsonMap["data"],
    );
    return data;
  }

  @override
  String toString() {
    return 'ErrResponse{status: $status,  message: $message, data: $data}';
  }
}
