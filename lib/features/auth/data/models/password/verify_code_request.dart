class VerifyCodeRequest {
  final String email;
  final String code;
  VerifyCodeRequest({required this.code, required this.email});
  Map<String, dynamic> toJson() => {'email': email, 'code': code};
}
