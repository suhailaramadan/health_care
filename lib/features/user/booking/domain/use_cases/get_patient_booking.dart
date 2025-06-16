import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBookingPatient {
  final BookingPatientRepository _bookingRepository;
  const GetBookingPatient(this._bookingRepository);
  Future<Either<Failure, BookingPatientResponse>> call() =>
      _bookingRepository.getBookingpatient();
}
