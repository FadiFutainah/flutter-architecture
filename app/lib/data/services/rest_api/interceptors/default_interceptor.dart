import 'dart:io';

import 'package:app/data/services/token_manager.dart';
import 'package:dio/dio.dart';

class DefaultInterceptor extends InterceptorsWrapper {
  void refreshTokens(Response response) {
    if (response.data == null || response.data['data'] == null) return;
    if (response.data['data']['access'] != null) {
      TokenManager().setTokens(access: response.data['data']['access']);
    }
    if (response.data['data']['refresh'] != null) {
      TokenManager().setTokens(refresh: response.data['data']['refresh']);
    }
  }

  Future<void> retryRefreshToken() async {
    // UserRepository userRepository = serviceLocator.get<UserRepository>();
    // ResponseEntity responseEntity = await userRepository.refreshToken();
    // if (!responseEntity.hasError) {
    // parse the response and get the tokens
    // Response response = Response.fromJson(responseEntity.data);
    // TokenManager()
    // .setTokens(access: response.access, refresh: response.refresh);
    // }
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse) {
      if (err.response!.statusCode == HttpStatus.unauthorized) {
        await retryRefreshToken();
      }
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    refreshTokens(response);
    super.onResponse(response, handler);
  }
}
