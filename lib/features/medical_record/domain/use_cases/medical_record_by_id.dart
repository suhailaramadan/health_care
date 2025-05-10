import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class MedicalRecordUseCase {
  final MedicalRecordRepository medicalRecordRepository;
  MedicalRecordUseCase(this.medicalRecordRepository);
  Future<Either<Failure, List<MedicalRecordPatientEntity>>> call(int id) =>
      medicalRecordRepository.getMedicalRecordById(id);
}
