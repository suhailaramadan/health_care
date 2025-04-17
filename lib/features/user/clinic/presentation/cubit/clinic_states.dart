import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';

abstract class ClinicState {}

class ClinicInitial extends ClinicState {}

class GetClinicsSuccess extends ClinicState {
  List<ClinicEntity> clinicEntity;
  GetClinicsSuccess(this.clinicEntity);
}

class GetSearchSuccess extends ClinicState {
  List<ClinicEntity> searchEntity;
  GetSearchSuccess(this.searchEntity);
}

class GetClinicsLoading extends ClinicState {}

class GetSearchLoading extends ClinicState {}

class GetSearchError extends ClinicState {
  final String message;
  GetSearchError(this.message);
}

class GetClinicsError extends ClinicState {
  final String message;
  GetClinicsError(this.message);
}
