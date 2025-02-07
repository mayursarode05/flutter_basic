
abstract class BaseService {
  Future<dynamic> getResponse(String url,Map<String,dynamic> params,Map<String,String> headers, Map<String,dynamic> queryParameters);
  Future<dynamic> postResponse(String url,Map<String,dynamic> params,Map<String,String> headers, Map<String,dynamic> queryParameters);
  Future<dynamic> patchResponse(String url,Map<String,dynamic> params,Map<String,String> headers, Map<String,dynamic> queryParameters);
  Future<dynamic> deleteResponse(String url,Map<String,dynamic> params,Map<String,String> headers, Map<String,dynamic> queryParameters);
}