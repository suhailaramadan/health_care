import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/doctor/domain/entities/doctor_entity.dart';
import 'package:graduation_project/features/doctor/domain/repository/doctor_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDoctors {
  final DoctorRepository _doctorRepository;
  const GetDoctors(this._doctorRepository);
  Future<Either<Failure, List<DoctorEntity>>> call() =>
      _doctorRepository.getDoctors();
}

@lazySingleton
class GetDoctorsByClinicId {
  final DoctorRepository _doctorRepository;
  const GetDoctorsByClinicId(this._doctorRepository);
  Future<Either<Failure, List<DoctorEntity>>> call(int clinicId) =>
      _doctorRepository.getDoctorsByClinicId(clinicId);
}
