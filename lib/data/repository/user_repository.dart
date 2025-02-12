import 'package:my_app/data/apis/app_base_service.dart';
import 'package:my_app/data/apis/app_service.dart';

class UserRepository {
  final BaseService _appService = AppService();

  Future<dynamic> getUserInfo(String url, Map<String,dynamic> params, Map<String,String> headers, Map<String,dynamic> queryParameters) async {
    try{
      dynamic response =  await _appService.getResponse(url, params, headers, queryParameters);
      return response;
    }
    catch(e){
      rethrow;
    }
  }
  Future<dynamic> updateUserInfo(String url, Map<String,dynamic> params, Map<String,String> headers, Map<String,dynamic> queryParameters) async {
    try{
      dynamic response =  await _appService.patchResponse(url, params, headers, queryParameters);
      return response;
    }
    catch(e){
      rethrow;
    }
  }
}