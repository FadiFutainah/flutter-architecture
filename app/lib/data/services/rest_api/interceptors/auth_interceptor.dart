import 'dart:io';

import 'package:app/data/services/token_manager.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {
  TokenManager tokenManager = TokenManager();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String accessToken = await tokenManager.accessToken;
    if (accessToken != '') {
      options.headers[HttpHeaders.authorizationHeader] = "JWT $accessToken";
      options.headers[HttpHeaders.acceptHeader] = "application/json";
    }
    super.onRequest(options, handler);
  }
}
