class UserResponse {
  String email;
  String name;
  UserResponse({required this.email, required this.name});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
