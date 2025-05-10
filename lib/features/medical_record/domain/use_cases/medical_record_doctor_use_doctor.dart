import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class MedicalRecordDoctorUseCase {
  final MedicalRecordRepository medicalRecordRepository;
  MedicalRecordDoctorUseCase(this.medicalRecordRepository);
  Future<Either<Failure, List<MedicalRecordPatientEntity>>> call() =>
      medicalRecordRepository.getDoctorMedicalRecord();
}
