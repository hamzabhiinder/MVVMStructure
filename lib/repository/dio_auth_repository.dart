

import 'package:mvvmstructure/data/network/BaseApiServices.dart';
import 'package:mvvmstructure/data/network/DioNetworkApi.dart';
import 'package:mvvmstructure/res/app_url.dart';

class DioAuthRepository  {

  BaseApiServices _apiServices = DioNetworkApi() ;


  Future<dynamic> loginApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.postGetApiResponse(AppUrl.loginUrl, data);
      return response ;

    }catch(e){
      throw e ;
    }
  }

  Future<dynamic> signUpApi(dynamic data )async{

    try{

      dynamic response = await _apiServices.postGetApiResponse(AppUrl.signUpUrl, data);
      return response ;


    }catch(e){
      throw e ;
    }
  }



}