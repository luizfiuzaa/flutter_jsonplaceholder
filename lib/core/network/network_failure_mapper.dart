import 'package:dio/dio.dart';

import '../error/failure.dart';

abstract final class NetworkFailureMapper {
  static Failure fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
        return const Failure.timeout();
      case DioExceptionType.connectionError:
        return const Failure.noConnection();
      case DioExceptionType.badResponse:
        return Failure.server(
          statusCode: exception.response?.statusCode,
          body: exception.response?.data?.toString(),
        );
      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        return Failure.unexpected(exception.message ?? exception.toString());
    }
  }
}
