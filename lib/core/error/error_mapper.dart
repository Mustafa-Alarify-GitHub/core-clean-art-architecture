import 'package:dio/dio.dart';
import 'failure.dart';

class ErrorMapper {
  static Failure map(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const NetworkFailure('Connection timeout');

        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final message = error.response?.data?['message'] ?? 'Server error';
          return ServerFailure('[$statusCode] $message');

        case DioExceptionType.connectionError:
          return const NetworkFailure('No internet connection');

        default:
          return const UnexpectedFailure('Unexpected error occurred');
      }
    }

    return const UnexpectedFailure('Unknown error');
  }
}
