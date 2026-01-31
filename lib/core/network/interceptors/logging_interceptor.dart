import 'package:dio/dio.dart';

// Print Logs for development
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('━━━━━━━━━━━━━━━ REQUEST ━━━━━━━━━━━━━━━');
    print('URI: ${options.uri}');
    print('METHOD: ${options.method}');
    print('HEADERS: ${options.headers}');
    print('QUERY: ${options.queryParameters}');
    print('BODY: ${options.data}');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('━━━━━━━━━━━━━━━ RESPONSE ━━━━━━━━━━━━━━━');
    print('URI: ${response.requestOptions.uri}');
    print('STATUS: ${response.statusCode}');
    print('DATA: ${response.data}');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('━━━━━━━━━━━━━━━ ERROR ━━━━━━━━━━━━━━━');
    print('URI: ${err.requestOptions.uri}');
    print('STATUS: ${err.response?.statusCode}');
    print('MESSAGE: ${err.message}');
    print('DATA: ${err.response?.data}');
    print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

    super.onError(err, handler);
  }
}
