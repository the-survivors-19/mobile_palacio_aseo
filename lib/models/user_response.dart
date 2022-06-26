class UserResponse {
  final int id;
  final String fullName;
  final String phone;
  final String address;
  final String email;
  final String photo;

  UserResponse({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.email,
    required this.photo,
  });

  static UserResponse fromJson(Map<String, dynamic> json) {
    String photo = json['photo'] ?? '';
    return UserResponse(
        id: json['id'],
        fullName: json['full_name'],
        phone: json['phone'],
        address: json['address'],
        email: json['email'],
        photo: photo);
  }
}
