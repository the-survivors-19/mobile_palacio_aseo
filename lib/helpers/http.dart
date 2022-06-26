import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:palacio_aseo/helpers/http_response.dart';

class Http {
  Dio? _dio;
  Logger? _logger;
  late bool _logsEnabled;

  Http({
    required Dio dio,
    required Logger logger,
    bool logsEnabled = false,
  }) {
    _dio = dio;
    _logger = logger;
    _logsEnabled = logsEnabled;
  }

  Future<HttpResponse<T>> request<T>({
    String path = '/',
    String method = 'GET',
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? formData,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await _dio?.request(
        path,
        options: Options(
          method: method,
          headers: headers,
        ),
        queryParameters: queryParameters,
        data: formData != null ? FormData.fromMap(formData) : data,
      );
      if (_logsEnabled) _logger?.i(response?.data);
      if (parser != null) return HttpResponse.success(parser(response?.data));
      return HttpResponse.success<T>(response?.data);
    } catch (e) {
      if (_logsEnabled) _logger?.e(e);
      int statusCode = -1;
      String message = 'unknown error';
      dynamic data;

      if (e is DioError) {
        message = e.message;
        if (e.response != null) {
          statusCode = e.response?.statusCode ?? statusCode;
          message = e.response?.statusMessage ?? message;
          data = e.response?.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }
}
