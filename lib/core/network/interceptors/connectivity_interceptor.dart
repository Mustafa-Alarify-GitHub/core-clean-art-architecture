import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// Check internet is connection
class ConnectivityInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivity = await Connectivity().checkConnectivity();

    if (connectivity == ConnectivityResult.none) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: 'لا يوجد اتصال با الانترنت',
          type: DioExceptionType.connectionError,
        ),
      );
    }

    super.onRequest(options, handler);
  }
}
