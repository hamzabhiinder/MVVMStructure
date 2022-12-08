
import 'package:mvvmstructure/data/network/BaseApiServices.dart';
import 'package:mvvmstructure/data/network/NetworkApiServices.dart';
import 'package:mvvmstructure/res/app_Url.dart';

class AuthRepository {
  BaseApiServices apiServices=NetworkApiService();

  Future<dynamic> login(dynamic data)async{
   try {
      dynamic response=await apiServices.postGetApiResponse(AppUrl.loginUrl, data);
    return response;
   } catch (e) {
     throw e;
   }
  }


  Future<dynamic> register(dynamic data)async{
   try {
      dynamic response=await apiServices.postGetApiResponse(AppUrl.SignUpUrl, data);
    return response;
   } catch (e) {
     throw e;
   }
  }
}