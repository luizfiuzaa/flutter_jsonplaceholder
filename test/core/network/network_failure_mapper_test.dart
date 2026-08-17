import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_placeholder_test/core/error/failure.dart';
import 'package:json_placeholder_test/core/network/network_failure_mapper.dart';

void main() {
  final requestOptions = RequestOptions(path: '/posts');

  DioException exceptionOf(
    DioExceptionType type, {
    Response<dynamic>? response,
  }) {
    return DioException(
      requestOptions: requestOptions,
      type: type,
      response: response,
    );
  }

  group('NetworkFailureMapper', () {
    test('maps connection timeout to Failure.timeout', () {
      final failure = NetworkFailureMapper.fromDioException(
        exceptionOf(DioExceptionType.connectionTimeout),
      );

      expect(failure, const Failure.timeout());
    });

    test('maps receive timeout to Failure.timeout', () {
      final failure = NetworkFailureMapper.fromDioException(
        exceptionOf(DioExceptionType.receiveTimeout),
      );

      expect(failure, const Failure.timeout());
    });

    test('maps connection error to Failure.noConnection', () {
      final failure = NetworkFailureMapper.fromDioException(
        exceptionOf(DioExceptionType.connectionError),
      );

      expect(failure, const Failure.noConnection());
    });

    test('maps bad response to Failure.server carrying the status code', () {
      final failure = NetworkFailureMapper.fromDioException(
        exceptionOf(
          DioExceptionType.badResponse,
          response: Response<dynamic>(
            requestOptions: requestOptions,
            statusCode: 503,
            statusMessage: 'Service Unavailable',
          ),
        ),
      );

      expect(failure, isA<ServerFailure>());
      expect((failure as ServerFailure).statusCode, 503);
    });

    test('maps cancel to Failure.unexpected', () {
      final failure = NetworkFailureMapper.fromDioException(
        exceptionOf(DioExceptionType.cancel),
      );

      expect(failure, isA<UnexpectedFailure>());
    });

    test('every failure exposes a non-empty human readable message', () {
      const failures = <Failure>[
        Failure.timeout(),
        Failure.noConnection(),
        Failure.server(statusCode: 500),
        Failure.serialization('boom'),
        Failure.cache('boom'),
        Failure.unexpected('boom'),
      ];

      for (final failure in failures) {
        expect(failure.message, isNotEmpty, reason: '$failure has no message');
      }
    });
  });
}
