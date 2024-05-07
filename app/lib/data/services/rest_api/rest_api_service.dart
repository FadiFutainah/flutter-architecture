import 'package:app/data/models/enums.dart';
import 'package:app/data/models/response_entity.dart';
import 'package:dio/dio.dart';

import 'rest_api_base.dart';

class RestApiService extends Rest {
  RestApiService({
    required super.serverAddress,
    required super.tokenType,
    super.connectTimeout,
    super.receiveTimeout,
    super.debug,
  });

  @override
  Future<ResponseEntity> request(
    String endpoint,
    HttpRequestType requestType, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    bool sendToken = true,
    CancelToken? cancelToken,
  }) async {
    headers ??= super.defaultHeaders;
    Dio? client = sendToken ? authorizedClient : normalClient;
    String url = serverAddress + endpoint;
    Options options = Options(
      headers: headers,
      contentType: 'application/json',
    );
    Response? response;
    try {
      switch (requestType) {
        case HttpRequestType.get:
          response = await client!.get(
            url,
            options: options,
            cancelToken: cancelToken,
            queryParameters: queryParameters,
          );
          break;
        case HttpRequestType.post:
          response = await client!.post(
            url,
            data: body,
            options: options,
            cancelToken: cancelToken,
            queryParameters: queryParameters,
          );
          break;
        case HttpRequestType.delete:
          response = await client!.delete(
            url,
            data: body,
            options: options,
            cancelToken: cancelToken,
            queryParameters: queryParameters,
          );
          break;
        case HttpRequestType.put:
          response = await client!.put(
            url,
            data: body,
            options: options,
            cancelToken: cancelToken,
            queryParameters: queryParameters,
          );
          break;
        default:
      }
      return ResponseEntity.fromJson(
          json: response!.data, statusCode: response.statusCode);
    } on DioException catch (e) {
      if (e.response != null && e.response!.data is Map<String, dynamic>) {
        return ResponseEntity.fromJson(
            json: e.response!.data, statusCode: e.response!.statusCode);
      }
      return ResponseEntity.failed();
    } on Exception {
      return ResponseEntity.failed();
    }
  }
}
