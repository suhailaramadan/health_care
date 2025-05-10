import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';
import 'package:graduation_project/features/medical_record/data/model/patient_medical_record_response/patient_data.dart';

extension MedicalRecordPatientMapper on PatientData {
  MedicalRecordPatientEntity get toEntity => MedicalRecordPatientEntity(
      clinicName: clinicName,
      dateOfVisit: dateOfVisit,
      diagnosis: diagnosis,
      doctorId: doctorId,
      doctorName: doctorName,
      id: id,
      notes: notes,
      patientId: patientId,
      treatment: treatment);
}
