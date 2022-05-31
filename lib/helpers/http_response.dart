class HttpResponse<T> {
  final T? data;
  final HttpError? error;

  HttpResponse(
    this.data,
    this.error,
  );

  static HttpResponse<T> success<T>(T data) => HttpResponse(data, null);
  static HttpResponse<T> fail<T>({
    required int statusCode,
    required String msg,
    required dynamic data,
  }) =>
      HttpResponse(
        null,
        HttpError(
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
