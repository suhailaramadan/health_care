import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_response.dart';
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart';

class UpdateMedicalRecordUseCase {
  final MedicalRecordRepository medicalRecordRepository;
  UpdateMedicalRecordUseCase(this.medicalRecordRepository);
  Future<Either<Failure, UpdateMedicalRecordResponse>> call(
      UpdateMedicalRecordModel medicalRecordModel, int bookingId) async {
    return await medicalRecordRepository.updateMedicalRecord(
        medicalRecordModel, bookingId);
  }
}
