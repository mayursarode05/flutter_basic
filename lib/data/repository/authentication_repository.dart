import 'package:my_app/data/apis/app_base_service.dart';
import 'package:my_app/data/apis/app_service.dart';


class AuthenticationRepository{

   final BaseService _appService = AppService();

    Future<dynamic> signIn(String url, Map<String, dynamic> requestData,
      Map<String, String> headerData, Map<String, dynamic> queryParam) async {
    try {
      dynamic response = await _appService.postResponse(
          url, requestData, headerData, queryParam);
      return response;
    } catch (error) {
      rethrow;
    }
  }
  Future<dynamic> signUp(String url, Map<String, dynamic> requestData,
      Map<String, String> headerData, Map<String, dynamic> queryParam) async {
    try {
      dynamic response = await _appService.postResponse(
          url, requestData, headerData, queryParam);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}