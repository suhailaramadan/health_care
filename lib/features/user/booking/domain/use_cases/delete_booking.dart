import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteBookingUseCase {
  final BookingRepository repository;
  DeleteBookingUseCase(this.repository);
  Future<Either<Failure, DeleteBookingEntity>> call(int bookingId) =>
      repository.deleteBooking(bookingId);
}
