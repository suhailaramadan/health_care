import 'package:flutter/cupertino.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';

abstract class ClinicState {}

class ClinicInitial extends ClinicState {}

class GetClinicsSuccess extends ClinicState {
  final List<ClinicEntity> clinicEntity;
  GetClinicsSuccess(this.clinicEntity);
}

class GetClinicsLoading extends ClinicState {}

class GetClinicsError extends ClinicState {
  final String message;
  GetClinicsError(this.message);
}
