import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_by_doctor_id_response.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentByDoctorIdResponse> getAppointmentDoctorById(
      String doctorId);
}
