import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';

abstract class BookingRepository {
  Future<Either<Failure, List<BookingEntity>>> getBookingPatient();
}
