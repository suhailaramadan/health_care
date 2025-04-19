import 'package:flutter/material.dart';

class ChangePasswordRequest {
  final String email;
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  ChangePasswordRequest(
      {required this.email,
      required this.oldPassword,
      required this.newPassword,
      required this.confirmPassword});
  Map<String, dynamic> toJson() => {
        'email': email,
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      };
}
