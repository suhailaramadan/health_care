import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/data/models/delete_booking_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';

abstract class BookingRepository {
  Future<Either<Failure, BookingAppointment>> bookAppointment(
      BookingRequest request);
  Future<Either<Failure, DeleteBookingEntity>> deleteBooking(int bookingId);
  Future<void> deleteDayAppointment(String date);
}
