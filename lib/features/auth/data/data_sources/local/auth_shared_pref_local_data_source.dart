import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource extends AuthLocalDataSource {
  final SharedPreferences _sharedPref;
  AuthSharedPrefLocalDataSource(this._sharedPref);
  @override
  Future<void> saveToken(String token, String role) async {
    try {
      await _sharedPref.setString(CacheConstants.tokenKey, token);
      await _sharedPref.setString(CacheConstants.roleKey, role);
    } catch (e) {
      throw const LocalException('فشل في حفظ بيانات تسجيل الدخول');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      final token = _sharedPref.getString(CacheConstants.tokenKey);
      return token;
    } catch (e) {
      throw const LocalException(
          "فشل في استرجاع رمز التوثيق , يرجى المحاولة مرة أخرى");
    }
  }

  @override
  Future<String?> getUserRole() async {
    try {
      return _sharedPref.getString(CacheConstants.roleKey);
    } catch (e) {
      throw const LocalException(
          'فشل فى استرجاع نوع المستخدم , يرجى المحاولة مرة أخرى');
    }
  }

  @override
  Future<void> saveDoctorId(String id) async {
    try {
      await _sharedPref.setString(CacheConstants.doctorId, id);
    } catch (e) {
      throw const LocalException('فشل في حفظ الرقم التعريفي للدكتور');
    }
  }

  @override
  Future<void> savePatientId(String id) async {
    try {
      await _sharedPref.setString(CacheConstants.patientId, id);
    } catch (e) {
      throw const LocalException("فشل في حفظ الرقم التعريفي للطالب");
    }
  }

  @override
  Future<String?> getDoctorId() async {
    // try {
    return _sharedPref.getString(CacheConstants.doctorId);
    // } catch (e) {
    //   throw const LocalException('فشل في استرجاع الرقم التعريفي للدكتور');
    // }
  }

  @override
  Future<String?> getPatientId() async {
    return _sharedPref.getString(CacheConstants.patientId);
  }
  // @override
  // Future<void> saveUserData(
  //     String firstName, String lastName, String userImage) async {
  //   try {
  //     await _sharedPref.setString(CacheConstants.firstNameKey, firstName);
  //     await _sharedPref.setString(CacheConstants.lastNameKey, lastName);
  //     await _sharedPref.setString(CacheConstants.userImageKey, userImage);
  //   } catch (e) {
  //     throw const LocalException('فشل في حفظ بيانات المستخدم');
  //   }
  // }

  // @override
  // Future<String?> getFirstName() async {
  //   return _sharedPref.getString(CacheConstants.firstNameKey);
  // }

  // @override
  // Future<String?> getLastName() async {
  //   return _sharedPref.getString(CacheConstants.lastNameKey);
  // }

  // @override
  // Future<String?> getUserImage() async {
  //   return _sharedPref.getString(CacheConstants.userImageKey);
  // }

  @override
  Future<ProfileEntity> getPatientProfile() async {
    final id = _sharedPref.getString('id');
    final firstName = _sharedPref.getString('firstName');
    final lastName = _sharedPref.getString('lastName');
    final email = _sharedPref.getString('email');
    final college = _sharedPref.getString('college');
    final phoneNumber = _sharedPref.getString('phoneNumber');
    final nationalId = _sharedPref.getString('nationalID');
    final imageUrl = _sharedPref.getString('imageUrl');
    return ProfileEntity(id, firstName, lastName, email, college, phoneNumber,
        nationalId, imageUrl);
  }

  @override
  Future<ProfileDoctorEntity> getDoctorProfile() async {
    final id = _sharedPref.getString('id');
    final firstName = _sharedPref.getString('firstName');
    final lastName = _sharedPref.getString('lastName');
    final email = _sharedPref.getString('email');
    final college = _sharedPref.getString('college');
    final description = _sharedPref.getString('description');
    final specialty = _sharedPref.getString('specialty');
    final phoneNumber = _sharedPref.getString('phoneNumber');
    final nationalId = _sharedPref.getString('nationalID');
    final imageUrl = _sharedPref.getString('imageUrl');
    final clinicName = _sharedPref.getString('clinicName');
    final clinicId = _sharedPref.getInt('clinicId');
    return ProfileDoctorEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        college: college,
        specialty: specialty,
        phoneNumber: phoneNumber,
        nationalId: nationalId,
        imageUrl: imageUrl,
        clinicId: clinicId,
        clinicName: clinicName,
        description: description);
  }

  @override
  Future<void> savePatientProfile(ProfileEntity? profileEntity) async {
    if (profileEntity == null) {
      throw const LocalException("البيانات غير متوفرة");
    }
    await _sharedPref.setString('id', profileEntity.id ?? '');
    await _sharedPref.setString('firstName', profileEntity.firstName ?? '');
    await _sharedPref.setString('lastName', profileEntity.lastName ?? '');
    await _sharedPref.setString('email', profileEntity.email ?? '');
    await _sharedPref.setString('college', profileEntity.college ?? '');
    await _sharedPref.setString('phoneNumber', profileEntity.phoneNumber ?? '');
    await _sharedPref.setString('nationalID', profileEntity.nationalId ?? '');
    if (profileEntity.imageUrl != null) {
      await _sharedPref.setString('imageUrl', profileEntity.imageUrl ?? '');
    }
  }

  @override
  Future<void> clearUserData() async {
    await _sharedPref.remove('id');
    await _sharedPref.remove('firstName');
    await _sharedPref.remove('lastName');
    await _sharedPref.remove('email');
    await _sharedPref.remove('college');
    await _sharedPref.remove('phoneNumber');
    await _sharedPref.remove('nationalID');
    await _sharedPref.remove('imageUrl');
  }

  @override
  Future<void> savedDoctorProfile(
      ProfileDoctorEntity profileDoctorEntity) async {
    await _sharedPref.setString('id', profileDoctorEntity.id ?? '');
    await _sharedPref.setString(
        'firstName', profileDoctorEntity.firstName ?? '');
    await _sharedPref.setString('lastName', profileDoctorEntity.lastName ?? '');
    await _sharedPref.setString('email', profileDoctorEntity.email ?? '');
    await _sharedPref.setString(
        'specialty', profileDoctorEntity.specialty ?? '');
    await _sharedPref.setString(
        'description', profileDoctorEntity.description ?? '');
    await _sharedPref.setInt('clinicId', profileDoctorEntity.clinicId ?? 0);
    await _sharedPref.setString(
        'clinicName', profileDoctorEntity.clinicName ?? '');
    await _sharedPref.setString('college', profileDoctorEntity.college ?? '');
    await _sharedPref.setString(
        'phoneNumber', profileDoctorEntity.phoneNumber ?? '');
    await _sharedPref.setString(
        'nationalID', profileDoctorEntity.nationalId ?? '');
    if (profileDoctorEntity.imageUrl != null) {
      await _sharedPref.setString(
          'imageUrl', profileDoctorEntity.imageUrl ?? '');
    }
  }
}
