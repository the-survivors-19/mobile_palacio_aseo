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

  Future<HttpResponse> request({
    String path = '/',
    String method = 'GET',
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio?.request(
        path,
        options: Options(method: method, headers: headers),
        queryParameters: queryParameters,
        data: data,
      );
      if (_logsEnabled) _logger?.i(response?.data);
      return HttpResponse.success(response?.data);
    } catch (e) {
      if (_logsEnabled) _logger?.e(e);
      int statusCode = -1;
      String msg = 'unknown error';
      dynamic data;

      if (e is DioError) {
        msg = e.message;
        if (e.response != null) {
          statusCode = e.response?.statusCode ?? statusCode;
          msg = e.response?.statusMessage ?? msg;
          data = e.response?.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        msg: msg,
        data: data,
      );
    }
  }
}
