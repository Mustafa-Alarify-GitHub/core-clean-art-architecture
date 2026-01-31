import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/connectivity_interceptor.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: AppConstants.timeout),
        receiveTimeout: const Duration(seconds: AppConstants.receive),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      ConnectivityInterceptor(), // check internet connection
      AuthInterceptor(),         // add token
      LoggingInterceptor(),      // print logs for development
    ]);

    return dio;
  }
}
