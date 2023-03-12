

import 'package:mvvmstructure/data/network/NetworkApiServices.dart';


import '../data/network/BaseApiServices.dart';
import '../res/app_Url.dart';

class UpdatedRepository {
  BaseApiServices apiServices=NetworkApiService();

  Future updatedProfile()async{
   try {
   
      dynamic response=await apiServices.getGetApiResponseWithList(AppUrl.updateProfile);//change
    return response;
   } catch (e) {
     rethrow;
   }
  }

}