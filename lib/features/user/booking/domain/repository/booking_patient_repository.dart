import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';

abstract class BookingPatientRepository {
  Future<Either<Failure, BookingPatientResponse>> getBookingpatient(
      String token);
}
