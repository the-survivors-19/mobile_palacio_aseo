import 'package:palacio_aseo/models/user_response.dart';

class AuthenticationResponse {
  final String token;
  final UserResponse user;

  AuthenticationResponse({
    required this.token,
    required this.user,
  });

  static AuthenticationResponse fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      token: json['token'],
      user: UserResponse.fromJson(json['user']),
    );
  }
}
