import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:palacio_aseo/api/authentication_api.dart';
import 'package:palacio_aseo/helpers/constants.dart';
import 'package:palacio_aseo/helpers/http.dart';

abstract class DependencyInjection {
  static void initialize() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Constants.endPoint,
      ),
    );
    Logger logger = Logger();
    Http http = Http(
      dio: dio,
      logger: logger,
      logsEnabled: true,
    );
    final AuthenticationApi authenticationApi = AuthenticationApi(http);

    GetIt.instance.registerSingleton<AuthenticationApi>(authenticationApi);
  }
}
