import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/profile/data/data_source/remote/profile_remote_data_source.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/profile_doctor_response.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/update_doctor_profile_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_response.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: ProfileRemoteDataSource)
class ProfileApiRemoteDataSource extends ProfileRemoteDataSource {
  final Dio dio;
  ProfileApiRemoteDataSource(this.dio);

  @override
  Future<ProfileResponse> getPatientProfile(String token) async {
    try {
      final response = await dio.get("${ApiConstants.baseUrl}Patient",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ProfileResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? 'تعذر تحميل بيانات المستخدم');
    }
  }

  @override
  Future<String> updatePatientProfile(
      String token, UpdateProfileRequest request) async {
    try {
      final response = await dio.put("Patient",
          data: await request.toFormData(),
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Content-Type": "multipart/form-data"
          }));
      return response.data['message'] ?? 'تم التحديث بنجاح';
    } on DioException catch (e) {
      final message = e.response?.data['message'];

      throw RemoteException(message ?? 'تعذر تحديث بيانات المستخدم');
    } catch (e) {
      throw const RemoteException("تعذر تحديث بيانات المستخدم");
    }
  }

  @override
  Future<ProfileResponse> getPatientProfileById(String patientId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      final response = await dio.get("Patient/$patientId",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ProfileResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'تعذر تحميل بيانات المستخدم');
    }
  }

  @override
  Future<ProfileDoctorResponse> getDoctorProfile(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(CacheConstants.tokenKey);
    try {
      final response = await dio.get("Doctor/byToken",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ProfileDoctorResponse.fromJson(response.data);
    } catch (e) {
      String? message;
      if (e is DioException) {
        message = e.response?.data['message'];
      }
      throw RemoteException(message ?? 'تعذر تحميل بيانات المستخدم');
    }
  }

  @override
  Future<String> updateDoctorProfile(
      String token, UpdateDoctorProfileRequest request) async {
    try {
      final response = await dio.put("Doctor/update",
          data: await request.toFormData(),
          options: Options(headers: {
            'Authorization': 'Bearer $token',
            "Content-Type": "multipart/form-data"
          }));
      return response.data['message'] ?? 'تم التحديث بنجاح';
    } on DioException catch (e) {
      final message = e.response?.data['message'];
      throw RemoteException(message ?? 'تعذر تحديث بيانات الدكتور');
    }
  }
}
