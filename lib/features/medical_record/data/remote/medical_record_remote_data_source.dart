import 'package:dartz/dartz.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/medical_record_add_response.dart';
import 'package:graduation_project/features/medical_record/data/model/medical_record_delete_response.dart';
import 'package:graduation_project/features/medical_record/data/model/patient_medical_record_response/patient_medical_record_response.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_response.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_add_entity.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_update_entity.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';

abstract class MedicalRecordRemoteDataSource {
  Future<PatientMedicalRecordResponse> getMedicalRecordPatient(
      String patientId);
  Future<PatientMedicalRecordResponse> getMedicalRecordDoctor();
  Future<PatientMedicalRecordResponse> getMedicalRecordById(int id);
  Future<Unit> deleteMedicalRecord(int id);
  Future<MedicalRecordAddResponse> addMedicalRecord(AddMedicalRecordModel add);
  Future<UpdateMedicalRecordResponse> updateMedicalRecord(
      UpdateMedicalRecordModel data, int bookingId);
}
