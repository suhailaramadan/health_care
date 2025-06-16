import 'package:graduation_project/features/user/clinic/data/model/search_response/search_model.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';

extension SearchMapper on SearchModel {
  ClinicEntity get toEntity => ClinicEntity(id!, name!, imageUrl!);
}
