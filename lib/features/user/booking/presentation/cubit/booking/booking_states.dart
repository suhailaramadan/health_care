import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/use_cases/get_patient_booking.dart';

abstract class BookingStates {}

class BookingInitial extends BookingStates {}

class GetBookingLoading extends BookingStates {}

class GetBookingSuccess extends BookingStates {
  final BookingAppointment booking;
  GetBookingSuccess(this.booking);
}

class GetBookingPatientSuccess extends BookingStates {
  final BookingPatientResponse bookingPatientResponse;
  GetBookingPatientSuccess(this.bookingPatientResponse);
}

class GetBookingError extends BookingStates {
  final String message;
  GetBookingError(this.message);
}
