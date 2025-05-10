import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/medical_record_add_response.dart';
import 'package:graduation_project/features/medical_record/domain/repository/medical_record_repository.dart';

@override
class AddMedicalRecordUseCase {
  final MedicalRecordRepository medicalRecordRepository;
  AddMedicalRecordUseCase(this.medicalRecordRepository);
  Future<Either<Failure, MedicalRecordAddResponse>> call(
      AddMedicalRecordModel addMedicalRecordModel) {
    return medicalRecordRepository.addMedicalRecord(addMedicalRecordModel);
  }
}
