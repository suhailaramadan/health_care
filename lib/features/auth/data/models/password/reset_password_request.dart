class ResetPasswordRequest {
  final String newPassword;
  final String confirmPassword;
  final String email;
  final String code;
  ResetPasswordRequest(this.email, this.code,
      {required this.newPassword, required this.confirmPassword});
  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      };
}
