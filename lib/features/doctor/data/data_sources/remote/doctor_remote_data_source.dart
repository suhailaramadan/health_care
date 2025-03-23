import 'package:graduation_project/features/doctor/data/model/doctor_response/doctor_response.dart';

abstract class DoctorRemoteDataSource {
  Future<DoctorResponse> getDoctors();
  Future<DoctorResponse> getDoctorsByClinicId(int clinicId);
}
