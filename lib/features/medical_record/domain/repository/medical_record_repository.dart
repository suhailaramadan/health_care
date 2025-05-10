import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/medical_record_add_response.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_response.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_add_entity.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';

abstract class MedicalRecordRepository {
  Future<Either<Failure, List<MedicalRecordPatientEntity>>>
      getPatientMedicalRecord(String patientId);
  Future<Either<Failure, List<MedicalRecordPatientEntity>>>
      getDoctorMedicalRecord();
  Future<Either<Failure, List<MedicalRecordPatientEntity>>>
      getMedicalRecordById(int id);
  Future<Either<Failure, Unit>> deleteMedicalRecord(int id);
  Future<Either<Failure, MedicalRecordAddResponse>> addMedicalRecord(
      AddMedicalRecordModel addMedicalRecordModel);
  Future<Either<Failure, UpdateMedicalRecordResponse>> updateMedicalRecord(
      UpdateMedicalRecordModel data, int bookingId);
}
