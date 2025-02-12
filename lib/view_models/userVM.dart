import 'package:my_app/data/repository/user_repository.dart';
import 'package:my_app/utils/utils.dart';

class UserViewModel with ChangeNotifier{
  final UserRepository _userRepository = UserRepository();

  Future<dynamic> getUserInfo(String url, Map<String,dynamic> params, Map<String,String> headers, Map<String,dynamic> queryParameters) async {
    try{
      dynamic response =  await _userRepository.getUserInfo(url, params, headers, queryParameters);
      notifyListeners();
      return response;
    }
    catch(e){
      rethrow;
    }
  }

  Future<dynamic> updateUserInfo(String url, Map<String,dynamic> params, Map<String,String> headers, Map<String,dynamic> queryParameters) async {
    try{
      dynamic response =  await _userRepository.updateUserInfo(url, params, headers, queryParameters);
      notifyListeners();
      return response;
    }
    catch(e){
      rethrow;
    }
  }
}