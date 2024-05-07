import 'dart:io';

import 'package:app/data/models/enums.dart';
import 'package:app/data/models/response_entity.dart';
import 'package:dio/dio.dart';

import 'interceptors/auth_interceptor.dart';
import 'interceptors/default_interceptor.dart';

abstract class Rest {
  Rest({
    required this.serverAddress,

    /// used to recognize the authorization header
    required this.tokenType,

    /// default is
    /// <String, dynamic>{
    ///   HttpHeaders.contentTypeHeader: ContentType.json,
    ///   HttpHeaders.acceptHeader: ContentType.json,
    ///  };
    this.defaultHeaders,

    /// the connect and receive timeout are standardized to 30 seconds
    /// based on https://docs.oracle.com/cd/E19900-01/819-4742/abefk/index.html
    this.receiveTimeout = const Duration(seconds: 50),
    this.connectTimeout = const Duration(seconds: 50),

    /// if debug is true then the dio [LogInterceptor] is added to interceptors
    this.debug = false,

    /// if this variable is true all endpoints the service will append a slash
    /// to the last of the endpoint
    this.appendSlashToEndpoints = true,
  }) {
    defaultHeaders ??= <String, dynamic>{
      HttpHeaders.contentTypeHeader: ContentType.json,
      HttpHeaders.acceptHeader: ContentType.json,
    };

    _initializeClients();
  }

  final String serverAddress;
  final TokenType tokenType;
  final Duration receiveTimeout;
  final Duration connectTimeout;
  final bool debug;
  final bool appendSlashToEndpoints;

  Map<String, dynamic>? defaultHeaders;

  Dio? authorizedClient;
  Dio? normalClient;

  void _initializeClients() {
    authorizedClient = Dio(
      BaseOptions(
        baseUrl: serverAddress,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
    );

    normalClient = Dio(
      BaseOptions(
        baseUrl: serverAddress,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
    );

    if (debug) {
      normalClient!.interceptors.add(LogInterceptor());
      authorizedClient!.interceptors.add(LogInterceptor());
    }

    authorizedClient!.interceptors.addAll([
      AuthInterceptor(),
      DefaultInterceptor(),
    ]);

    normalClient!.interceptors.add(DefaultInterceptor());
  }

  Future<ResponseEntity> request(String endpoint, HttpRequestType requestType);
}
