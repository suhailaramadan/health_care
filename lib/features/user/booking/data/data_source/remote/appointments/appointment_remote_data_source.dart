import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_by_doctor_id_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_doctor_response/booking_doctor_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';

abstract class AppointmentRemoteDataSource {
  Future<AppointmentByDoctorIdResponse> getAppointmentDoctorById(
      String doctorId);
  Future<List<DoctorsAppointmentModel>> getDotorsAppointment();
  Future<DoctorsAppointmentModel> createAppointment(
      CreateRequestModel request, String token);
  Future<DeleteBookingEntity> deleteappointment(int id
      // {required int day,
      // required String startTime,
      // required String endTime,
      // required int duration}
      );
  Future<DoctorsAppointmentModel> updateAppointment(
      UpdateAppointmentRequest updateAppointmentRequest);
}
