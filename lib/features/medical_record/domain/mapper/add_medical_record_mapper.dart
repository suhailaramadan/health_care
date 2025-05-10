import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_add_entity.dart';

extension AddMedicalRecordMapper on AddMedicalRecordModel {
  MedicalRecordAddEntity get onEntity => MedicalRecordAddEntity(
      bookingsId: bookingsId,
      diagnosis: diagnosis,
      notes: notes,
      treatment: treatment);
}
