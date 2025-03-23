import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';
import 'package:graduation_project/features/user/clinic/data/model/clinics_response/clinic_model.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';

extension ProfileMapper on ProfileDataModel {
  ProfileEntity get toEntity => ProfileEntity(id, firstName, lastName, email,
      college, phoneNumber, nationalId, imageUrl);
}
