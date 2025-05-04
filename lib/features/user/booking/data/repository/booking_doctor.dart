import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_doctor_response/booking_doctor_response.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_doctor.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingDoctorRepository)
class BookingDoctorRepositoryImpl implements BookingDoctorRepository {
  final BookingRemoteDataSource remoteDataSource;
  BookingDoctorRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BookingDoctorResponse>> getBookingDoctor(
      String token) async {
    try {
      final booking = await remoteDataSource.getBookingDoctor(token);
      return Right(booking);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
