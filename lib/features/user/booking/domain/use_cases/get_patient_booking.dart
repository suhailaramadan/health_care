import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPatientBooking {
  final BookingRepository _bookingRepository;
  const GetPatientBooking(this._bookingRepository);
  Future<Either<Failure, List<BookingEntity>>> call() =>
      _bookingRepository.getBookingPatient();
}
