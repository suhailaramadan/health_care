import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_by_doctor_id_response.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentByDoctorIdResponse> getAppointmentDoctorById(
      String doctorId);
  Future<List<DoctorsAppointmentModel>> getDotorsAppointment();
  Future<DoctorsAppointmentModel> createAppointment(
      CreateRequestModel request, String token);
}
