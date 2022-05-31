import 'package:palacio_aseo/helpers/http.dart';
import 'package:palacio_aseo/helpers/http_response.dart';
import 'package:palacio_aseo/models/authentication_response.dart';

class AuthenticationApi {
  final Http _http;
  AuthenticationApi(this._http);

  Future<HttpResponse<AuthenticationResponse>> login({
    required String email,
    required String password,
  }) async {
    return _http.request<AuthenticationResponse>(
      path: '/login',
      method: 'POST',
      data: {
        'email': email,
        'password': password,
      },
    );
  }

  Future<HttpResponse<AuthenticationResponse>> register({
    required String fullName,
    required String phone,
    required String address,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return _http.request<AuthenticationResponse>(
      path: '/register',
      method: 'POST',
      data: {
        "full_name": fullName,
        "phone": phone,
        "address": address,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation
      },
    );
  }
}
