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
  Future<ProfileEntity> getPatientProfile();
  Future<void> clearUserData();
}
