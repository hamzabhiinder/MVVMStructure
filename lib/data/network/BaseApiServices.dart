abstract class BaseApiServices {
  Future<dynamic>  getGetApiResponse(String url);
  Future<dynamic>  getGetApiResponseWithList(String url);

  Future<dynamic>  postGetApiResponse(String url,dynamic data);

}