class LoginResponse {
  String token;
  String role;

  LoginResponse({required this.token, required this.role});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json['token'] as String,
        role: json['role'] as String,
      );
}
