import 'package:graduation_project/features/doctor/data/model/doctor_response/doctor_model.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';

extension DoctorMApper on DoctorModel {
  DoctorEntity get toEntity => DoctorEntity(id, firstName, lastName, email,
      clinicId, clinicName, description, imageUrl, phoneNumber, specialty);
}
