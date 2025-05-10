import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token, String role);
  Future<String?> getToken();
  Future<String?> getUserRole();
  // Future<void> saveUserData(
  //     String firstName, String lastName, String userImage);
  // Future<String?> getFirstName();
  // Future<String?> getLastName();
  // Future<String?> getUserImage();
  Future<void> savePatientProfile(ProfileEntity profileEntity);
  Future<void> savedDoctorProfile(ProfileDoctorEntity profileDoctorEntity);
  Future<ProfileDoctorEntity> getDoctorProfile();
  Future<ProfileEntity> getPatientProfile();
  Future<void> clearUserData();
  Future<void> saveDoctorId(String id);
  Future<void> savePatientId(String id);
  Future<String?> getDoctorId();
  Future<String?> getPatientId();
}
