
import 'package:mvvmstructure/data/network/NetworkApiServices.dart';
import 'package:mvvmstructure/res/app_Url.dart';

import '../data/network/BaseApiServices.dart';

class HomeRepository {
  
    BaseApiServices apiServices=NetworkApiService();

  Future fetchUniversityList()async{
   try {
   
      dynamic response=await apiServices.getGetApiResponseWithList(AppUrl.universityList);//change
    return response;
   } catch (e) {
     rethrow;
   }
  }
}