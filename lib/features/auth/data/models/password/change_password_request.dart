import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChangePasswordRequest {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  ChangePasswordRequest(
      {required this.oldPassword,
      required this.newPassword,
      required this.confirmPassword});
  Map<String, dynamic> toJson() => {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      };
  Future<FormData> toFormDate() async {
    final formMap = <String, dynamic>{
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': confirmPassword
    };
    return FormData.fromMap(formMap);
  }
}
