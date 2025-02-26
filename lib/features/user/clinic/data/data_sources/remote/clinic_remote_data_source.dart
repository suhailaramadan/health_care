import 'package:graduation_project/features/clinic/data/model/clinics_response/clinic_response.dart';

abstract class ClinicRemoteDataSource {
  Future<ClinicsResponse> getClinics();
}
