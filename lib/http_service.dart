import 'dart:convert';
import 'dart:developer';
import 'dart:io';
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
    // if (url.contains("<AUTH_TOKEN>")) {
    //   String sessionIdleTime = await SharedPreference.getSessionIdleTime();
    //   token = await SharedPreference.getAuthToken();
    //   int diff = 0;

    //   if (sessionIdleTime.isNotEmpty) {
    //     diff = DateTime.now()
    //             .difference(DateTime.parse(sessionIdleTime))
    //             .inMinutes %
    //         60;
    //   }

    //   if (token.isEmpty || diff > 30) {
    //     SharedPreference.saveUserSessionInfo("");
    //     getAccountSessionLog();
    //     url = "";
    //   } else {
    //     url = url.replaceAll("<AUTH_TOKEN>", token);
    //   }
    // }

   

    return url;
  }

  Future<T> get<T>(HttpService<T> resource) async {
    Map<String, String> headers = {
      "localtonet-skip-warning": "true",
    };
    String processedUrl = await authenticateUrl(resource.url!);
    if (processedUrl.isNotEmpty) {
      final uri = Uri.parse(processedUrl);
      final response = await http.get(uri, headers: headers);
      log("url ${uri}");
      // log("full json ${response.body}");
      if (response.statusCode == 100) {
        return buildTokenExpiredNavigator(resource);
      } else if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        //  SharedPreference.saveAuthToken()

        dynamic res;
        if (responseJson['status'] == 1) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == 0) {
          if (responseJson['errorCode'] == 100 ||
              responseJson['errorCode'] == "100") {
            return buildTokenExpiredNavigator(resource);
          } else {
            res = resource.errparse!(ErrResponse.fromJSON(responseJson));
          }
        }

        return res;
      } else {
        throw Exception(response.statusCode);
      }
    } else {
      return buildTokenExpiredErrorResponse(resource);
    }
  }

  Future<T> post<T>(HttpService<T> resource) async {
    String processedUrl = await authenticateUrl(resource.url!);

  

     Map<String, String> headers = {
      "localtonet-skip-warning": "true",  
    };
    if (processedUrl.isNotEmpty) {
      final uri = Uri.parse(processedUrl);
      final response = await http.post(uri,
          body: jsonEncode(resource.body), headers: headers);
      log("url ${uri}");
      // log("response code ${response.body}");
      log("response code ${response.statusCode}");
       log("response body ${response.body}");
      if (response.statusCode == 100) {
        return buildTokenExpiredNavigator(resource);
      } else if (response.statusCode == 200) {
        dynamic res;
        var responseJson = json.decode(response.body);
        if (responseJson['data'] == null && responseJson['status'] == true) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == 1) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == null) {
          res = resource.parse!(BaseResponse.fromJSON(responseJson));
        } else if (responseJson['status'] == 0) {
          if (responseJson['errorCode'] == 100 ||
              responseJson['errorCode'] == "100") {
            return buildTokenExpiredNavigator(resource);
          } else {
            res = resource.errparse!(ErrResponse.fromJSON(responseJson));
          }
        }
        return res;
      } else {
        throw Exception(response.statusCode);
      }
    } else {
      return buildTokenExpiredErrorResponse(resource);
    }
  }

  buildTokenExpiredNavigator(dynamic resource) {
   

  
}

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
        response: jsonMap["data"] != null ? list : null);
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

  ErrResponse(
      {this.status, this.message, this.data});

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
