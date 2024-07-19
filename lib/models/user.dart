class UserModel {
  final String userId;
  final String username;
  final String email;
  final String name;
  final String address;
  final DateTime birthDate;
  final String role;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.name,
    required this.address,
    required this.birthDate,
    required this.role,
  });
}
