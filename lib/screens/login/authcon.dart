import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/auth/servicelist.dart';
import 'package:ams/model/user_register.dart';

class AuthController{
  Future<List<Servicelist>> getallservice()async{
 return await  APIWeb().get(HttpService(url: Constant.service,
  parse: (base){

    return servicelistFromJson(base.response);
  },errparse: (e){
    return[];
      }));
}
  Future<String> addstoreuser(Userstore user)async{
    return await  APIWeb().post(HttpService(url: Constant.addmechanic,body: user.toJson(),
        parse: (base){

          return "successs";
        },errparse: (e){
          return e.message??"";
        }));
  }
}
