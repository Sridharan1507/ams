import 'package:ams/constant.dart';
import 'package:ams/http_service.dart';
import 'package:ams/model/stores/liststores.dart';

class HomeCon{
  Future<StoreList?> getstores()async{
    return await  APIWeb().get(HttpService(url: Constant.stores,
        body: {
          "coords": "12.982195561963922, 80.1407891580614",
          "category_id" :"NA"
        },
        parse: (base){

          return storeListFromJson(base.response);
        },errparse: (e){
          return null;
        }));
  }

}