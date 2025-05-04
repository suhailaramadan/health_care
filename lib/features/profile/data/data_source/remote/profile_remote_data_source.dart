import 'package:dio/dio.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/profile_doctor_response.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/update_doctor_profile_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_response.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> getPatientProfile(String token);
  Future<ProfileDoctorResponse> getDoctorProfile(String token);
  Future<String> updatePatientProfile(
      String token, UpdateProfileRequest request);
  Future<ProfileResponse> getPatientProfileById(String patientId);
  Future<String> updateDoctorProfile(
      String token, UpdateDoctorProfileRequest request);
}
