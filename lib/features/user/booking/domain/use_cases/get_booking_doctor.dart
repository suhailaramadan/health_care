import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_doctor_response/booking_doctor_response.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_doctor.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBookingDoctor {
  final BookingDoctorRepository bookingDoctorRepository;
  const GetBookingDoctor(this.bookingDoctorRepository);
  Future<Either<Failure, BookingDoctorResponse>> call(String token) =>
      bookingDoctorRepository.getBookingDoctor(token);
}
