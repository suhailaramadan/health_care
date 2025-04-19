import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/password/change_password_request.dart';
import 'package:graduation_project/features/auth/data/models/password/forget_password_request.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/login/login_response.dart';
import 'package:graduation_project/features/auth/data/models/password/reset_password_request.dart';
import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthAPIRemoteDataSource extends AuthRemoteDataSource {
  final Dio dio;
  AuthAPIRemoteDataSource(this.dio);
  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    FormData formData = await request.toFormData();
    try {
      final response = await dio.post(ApiConstants.registerPatientEndPoint,
          data: formData,
          options: Options(
            headers: {
              "Content-Type": "multipart/form-data",
            },
          ));

      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      String message = "حدث خطأ غير متوقع";
      if (exception is DioException) {
        if (exception.response != null && exception.response!.data != null) {
          final errors = exception.response!.data['errors'];
          if (errors is List && errors.isNotEmpty) {
            message = errors.join(",");
          } else if (errors is String) {
            message = errors;
          }
        }
      }
      throw RemoteException(message);
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.loginPatientEndPoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String message = "فشل في تسجيل الدخول";
      if (exception is DioException) {
        if (exception.response != null) {
          int statusCode = exception.response!.statusCode ?? 0;
          if (statusCode == 400) {
            message =
                "بيانات تسجيل الدخول غير صحيحة , يرجي التحقق من الايميل و كلمة المرور";
          } else if (statusCode == 401) {
            message = "غير مصرح لك بتسجيل الدخول , تحقق من بياناتك";
          } else {
            message = "حدث خطأ ما , حاول لاحقاً";
          }
        }
      }
      throw RemoteException(message);
    }
  }

  @override
  Future<void> forgetPassword(ForgetPasswordRequest request) async {
    final response = await dio
        .post("Authentication/Forget-Password", data: {'email': request.email});
    if (response.statusCode != 200) {
      throw RemoteException(response.statusMessage ?? '');
    }
  }

  @override
  Future<String> verifyCode(VerifyCodeRequest request) async {
    final response = await dio.post("Authentication/Verify-Code", data: {
      'email': request.email,
      'code': request.code,
    });
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw Exception('حدث خطأ فى السيرفر');
    }
  }

  @override
  Future<String> resetPassword(ResetPasswordRequest request) async {
    final response = await dio.post("Authentication/Reset-Password", data: {
      'code': request.code,
      'email': request.email,
      'newPassword': request.newPassword,
      'confirmPassword': request.confirmPassword,
    });
    print("Status------- ${response.statusCode}");
    print("Response=======> ${response.data}");
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw const RemoteException("فشل في إعادة تعيين كلمة المرور");
    }
  }

  @override
  Future<String> changePassword(ChangePasswordRequest request) async {
    final response = await dio.post("Authentication/Change-Password", data: {
      'email': request.email,
      "oldPassword": request.oldPassword,
      "newPassword": request.newPassword,
      "confirmPassword": request.confirmPassword,
    });
    if (response.statusCode == 200) {
      return response.data.toString();
    } else {
      throw const RemoteException("فشل في تغيير كلمة المرور");
    }
  }
}
