import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart';

@override
class DeleteMedicalRecord {
  final MedicalRecordRepository medicalRecordRepository;
  DeleteMedicalRecord(this.medicalRecordRepository);
  Future<Either<Failure, Unit>> call(int id) =>
      medicalRecordRepository.deleteMedicalRecord(id);
}
