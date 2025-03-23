import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';

abstract class DoctorsStates {}

class DoctorsInitial extends DoctorsStates {}

class GetDoctorsSuccess extends DoctorsStates {
  final List<DoctorEntity> doctorEntity;
  GetDoctorsSuccess(this.doctorEntity);
}

class GetDoctorsLoading extends DoctorsStates {}

class GetDoctorsError extends DoctorsStates {
  final String message;
  GetDoctorsError(this.message);
}
