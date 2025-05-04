import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/profile_doctor_model.dart';
import 'package:graduation_project/features/profile/data/model/profile_doctor_response/update_doctor_profile_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/Update_request.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getPatientProfile();
  Future<ProfileEntity?> getCachedPatientProfile();
  Future<Either<Failure, ProfileDoctorEntity>> getDoctorProfile();
  Future<Either<Failure, ProfileEntity>> getPatientProfileById(
      String patientId);
  Future<Either<Failure, String>> updatePatientProfile(
      UpdateProfileRequest request);
  Future<Either<Failure, String>> updateDoctorProfile(
      UpdateDoctorProfileRequest request);
}
