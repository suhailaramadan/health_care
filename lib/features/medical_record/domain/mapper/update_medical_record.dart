import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/domain/entity/medical_record_update_entity.dart';

extension UpdateMedicalRecordMapper on UpdateMedicalRecordModel {
  MedicalRecordUpdateEntity get toEntity =>
      MedicalRecordUpdateEntity(diagnosis, notes, treatment);
}
