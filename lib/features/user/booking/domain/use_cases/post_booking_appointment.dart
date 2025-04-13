import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PostBookAppointment {
  final BookingRepository repository;
  PostBookAppointment(this.repository);
  Future<Either<Failure, BookingAppointment>> call(BookingRequest request) =>
      repository.bookAppointment(request);
}
