import '../../domain/entities/user.dart';

class UserModel implements User {
  const UserModel({
    required this.id,
    required this.email,
  });

  @override
  final String id;

  @override
  final String email;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
    };
  }

  User toUser() {
    return User(id: id, email: email);
  }
}
