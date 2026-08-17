import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_endpoints.dart';

abstract final class DioFactory {
  static Dio create({String baseUrl = ApiEndpoints.baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: const {'Content-Type': 'application/json; charset=UTF-8'},
        responseType: ResponseType.json,
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: false),
      );
    }

    return dio;
  }
}
