import 'package:graduation_project/features/user/clinic/data/model/clinics_response/clinic_response.dart';
import 'package:graduation_project/features/user/clinic/data/model/search_response/search_response.dart';

abstract class ClinicRemoteDataSource {
  Future<ClinicsResponse> getClinics();
  Future<SearchResponse> search(String query);
  Future<ClinicsResponse> getClinicsByID(int id);
}
