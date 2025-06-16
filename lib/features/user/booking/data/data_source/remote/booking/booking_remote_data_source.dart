import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_by_id_response/booking_by_id_model.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_by_id_response/booking_by_id_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_doctor_response/booking_doctor_model.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_doctor_response/booking_doctor_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_response/booking_data_model.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_response/booking_response.dart';
import 'package:graduation_project/features/user/booking/data/models/delete_booking_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';

abstract class BookingRemoteDataSource {
  Future<BookingAppointment> bookAppointment(BookingRequest request);
  Future<BookingPatientResponse> getbookingPatient();
  Future<DeleteBookingResponse> deleteBooking(int bookingId, String token);
  Future<BookingDoctorResponse> getBookingDoctor(String date);
  Future<List<BookingDoctorModel>> getBookingDayDoctor(String date);
  Future<BookingByIdResponse> getBookingById(int id);
  Future<BookingResponse> getAllBookings();
}
