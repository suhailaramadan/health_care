import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/login/login_response.dart';
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
}
