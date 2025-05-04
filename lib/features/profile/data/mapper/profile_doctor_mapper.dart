import 'package:graduation_project/features/profile/data/model/profile_doctor_response/profile_doctor_model.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';

extension ProfileDoctorMapper on ProfileDoctorModel {
  ProfileDoctorEntity get toEntity => ProfileDoctorEntity(
      clinicId: clinicId,
      clinicName: clinicName,
      college: college,
      description: description,
      email: email,
      firstName: firstName,
      imageUrl: imageUrl,
      id: id,
      lastName: lastName,
      nationalId: nationalId,
      phoneNumber: phoneNumber,
      specialty: specialty);
}
