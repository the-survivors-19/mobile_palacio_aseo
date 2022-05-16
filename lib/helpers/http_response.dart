class HttpResponse {
  final dynamic data;
  final HttpError? error;

  HttpResponse({
    this.data,
    this.error,
  });

  static HttpResponse success(dynamic data) => HttpResponse(data: data);
  static HttpResponse fail({
    required int statusCode,
    required String msg,
    required dynamic data,
  }) =>
      HttpResponse(
        error: HttpError(
          statusCode: statusCode,
          msg: msg,
          data: data,
        ),
      );
}

class HttpError {
  final int statusCode;
  final String msg;
  final dynamic data;

  HttpError({
    required this.statusCode,
    required this.msg,
    required this.data,
  });
}
