import 'package:flutter/widgets.dart';
import 'package:my_app/data/repository/authentication_repository.dart';

class AuthenticationViewModel with ChangeNotifier {
   final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<dynamic> signIn(String url, Map<String, dynamic> requestData,
      Map<String, String> headerData, Map<String, dynamic> queryParam) async {
    try {
      dynamic response = await _authenticationRepository.signIn(
          url, requestData, headerData, queryParam);
      notifyListeners();
      return response;
    } catch (e) {
      
      rethrow;
    }
  }
  Future<dynamic> signUp(String url, Map<String, dynamic> requestData,
      Map<String, String> headerData, Map<String, dynamic> queryParam) async {
    try {
      dynamic response = await _authenticationRepository.signIn(
          url, requestData, headerData, queryParam);
      notifyListeners();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
