class AuthenticationResponse {
  final String token;
  final Object user;

  AuthenticationResponse({
    required this.token,
    required this.user,
  });

  static AuthenticationResponse fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      token: json['token'],
      user: json['user'],
    );
  }
}
