import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_response/booking_data_model.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllBookingsUseCase {
  final BookingPatientRepository bookingPatientRepository;
  GetAllBookingsUseCase(this.bookingPatientRepository);
  Future<Either<Failure, List<BookingDataModel>>> call() =>
      bookingPatientRepository.getAllBookings();
}
