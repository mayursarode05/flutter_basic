import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/config/app_config.dart';
import 'package:my_app/data/apis/app_base_service.dart';

class AppService implements BaseService {
  @override
  Future deleteResponse(String url, Map<String, dynamic> params,
      Map<String, String> headers, Map<String, dynamic> queryParameters) {
    
    throw UnimplementedError();
  }

  @override
  Future getResponse(String url, Map<String, dynamic> params,
      Map<String, String> headers, Map<String, dynamic> queryParameters) async {
    dynamic responseJson;
    final finalUrl = validateURL(url);
    Uri uri = getUri(finalUrl, queryParameters);
    headers = getHeader(headers);
    final response =
        await http.get(uri, headers: headers);
    responseJson = _parseToJson(response.body);
    return responseJson;
  }

  @override
  Future patchResponse(String url, Map<String, dynamic> params,
      Map<String, String> headers, Map<String, dynamic> queryParameters) async {
    dynamic responseJson;
    final finalUrl = validateURL(url);
    Uri uri = getUri(finalUrl, queryParameters);
    headers = getHeader(headers);
    final response =
        await http.patch(uri, headers: headers, body: jsonEncode(params));
    responseJson = _parseToJson(response.body);
    return responseJson;
  }

  @override
  Future postResponse(
      String url,
      Map<String, dynamic> params,
      Map<String, String> apiHeaders,
      Map<String, dynamic> queryParameters) async {
    dynamic responseJson;
    final finalUrl = validateURL(url);
    Uri uri = getUri(finalUrl, queryParameters);
    apiHeaders = getHeader(apiHeaders);
    final response =
        await http.post(uri, headers: apiHeaders, body: jsonEncode(params));
    responseJson = _parseToJson(response.body);
    return responseJson;
  }

  String validateURL(String url) {
    // Regular expression to match a URL
    final urlPattern = RegExp(
      r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$',
      caseSensitive: false,
    );

    if (urlPattern.hasMatch(url)) {
      return url; // Valid URL
    } else {
      return "${AppConfig.baseUrl}$url";
    }
  }

  /// Generate Uri with or without query string
  Uri getUri(String url, Map<String, dynamic> queryParameters) {
    var uri = Uri.parse(url);
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }
    return uri;
  }

  /// Generate Header for api
  Map<String, String> getHeader(Map<String, String> header) {
    Map<String, String> tempHeader = Map.from(header);

    tempHeader['Content-Type'] = 'application/json';

    // if (AppConfig.isMsalUsed) {
    //   String? accessToken = Provider.of<AuthenticationHelper>(
    //           navigatorKey.currentState!.context,
    //           listen: false)
    //       .accessToken;
    //   if (accessToken != null && accessToken.isNotEmpty) {
    //     tempHeader['Authorization'] = 'Bearer $accessToken';
    //   }
    // }

    // String? accessToken = Provider.of<AuthenticationViewModel>(
    //         navigatorKey.currentState!.context,
    //         listen: false)
    //     .userModel
    //     ?.token;

    // if (accessToken != null && accessToken.isNotEmpty) {
    //   tempHeader['Authorization'] = accessToken;
    // }
    return tempHeader;
  }

  dynamic _parseToJson(String responseBody) {
    dynamic responseBodyData =
        isValidJson(responseBody) ? json.decode(responseBody) : responseBody;
    if (responseBodyData is List) {
      return responseBodyData
          .map((item) => Map<String, dynamic>.from(item))
          .toList();
    } else if (responseBodyData is Map) {
      return Map<String, dynamic>.from(responseBodyData);
    } else {
      return responseBodyData;
    }
  }

  bool isValidJson(String jsonString) {
    try {
      json.decode(jsonString);
      return true;
    } catch (_) {
      return false;
    }
  }
}
