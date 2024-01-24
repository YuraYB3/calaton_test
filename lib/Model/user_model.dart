class UserModel {
  String email;
  String name;

  UserModel({required this.email, required this.name});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
