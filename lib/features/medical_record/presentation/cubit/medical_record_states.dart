import 'package:graduation_project/features/medical_record/data/model/medical_record_add_response/add_medical_record_model.dart';
import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';

import 'package:graduation_project/features/medical_record/domain/entity/medical_record_patient_entity.dart';

abstract class MedicalResocrdSates {}

class InitialState extends MedicalResocrdSates {}

class GetMedicalRecordLoading extends MedicalResocrdSates {}

class GetDeleteMedicalRecordSuccess extends MedicalResocrdSates {}

class GetMedicalRecordPatientSuccess extends MedicalResocrdSates {
  final List<MedicalRecordPatientEntity> medicalRecord;
  GetMedicalRecordPatientSuccess(this.medicalRecord);
}

class AddMedicalRecordSuccess extends MedicalResocrdSates {
  final AddMedicalRecordModel add;
  AddMedicalRecordSuccess(this.add);
}

class UpdateMedicalRecordSuccess extends MedicalResocrdSates {
  final UpdateMedicalRecordModel add;
  UpdateMedicalRecordSuccess(this.add);
}

class GetMedicalRecordError extends MedicalResocrdSates {
  final String message;
  GetMedicalRecordError(this.message);
}
