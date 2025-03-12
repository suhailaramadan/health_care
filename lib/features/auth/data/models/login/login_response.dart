import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';

class LoginResponse extends UserEntity {
  String? token;
  String? role;

  LoginResponse({required this.token, required this.role})
      : super(token: token, role: role);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'] as String?,
        role: json['role'] as String?,
      );
}
