import 'package:graduation_project/features/user/clinic/data/model/clinics_response/clinic_model.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';

extension ClinicMapper on ClinicModel {
  ClinicEntity get toEntity => ClinicEntity(id, name, imageUrl);
}
