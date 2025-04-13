import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';

abstract class BookingRemoteDataSource {
  Future<BookingAppointment> bookAppointment(BookingRequest request);
  Future<BookingPatientResponse> getbookingPatient(String token);
}
