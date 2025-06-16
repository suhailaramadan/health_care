import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_by_id_response/booking_by_id_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_by_id_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetBookingByIdUseCase {
  final BookingPatientRepository bookingPatientRepository;
  GetBookingByIdUseCase(this.bookingPatientRepository);
  Future<Either<Failure, BookingByIdResponse>> call(int id) {
    print("Usecase id $id");
    return bookingPatientRepository.getBokkingById(id);
  }
}
