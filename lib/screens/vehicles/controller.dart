import 'package:ams/http_service.dart';

import '../../constant.dart';

class Controller{
  static Future<int> addinquiry(String id)async{
  return await  APIWeb().post(HttpService(
        url: Constant.useraddenquiry+id,
        body: {},
        parse: (response) {
          return 1;
        },
        errparse: (response) {
          return 0;


        }));
    
  }
}