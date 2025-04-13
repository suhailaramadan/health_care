// import 'package:dartz/dartz.dart';
// import 'package:graduation_project/core/error/exceptions.dart';
// import 'package:graduation_project/core/error/failure.dart';
// import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
// import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart';
// import 'package:graduation_project/features/user/booking/data/mapper/booking_mapper.dart';
// import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';
// import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
// import 'package:injectable/injectable.dart';

// @LazySingleton(as: BookingRepository)
// class BookingRepositoryImpl extends BookingRepository {
//   final BookingRemoteDataSource _bookingRemoteDataSource;
//   final AuthLocalDataSource _authLocalDataSource;
//   BookingRepositoryImpl(
//       this._bookingRemoteDataSource, this._authLocalDataSource);
//   @override
//   Future<Either<Failure, List<BookingEntity>>> getBookingPatient() async {
//     final token = await _authLocalDataSource.getToken();
//     try {
//       final response = await _bookingRemoteDataSource.getPatientBooking(token!);
//       return Right(response.data!.map((booking) => booking.toEntity).toList());
//     } on RemoteException catch (exception) {
//       return Left(Failure(exception.message));
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart';

import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingRepository)
class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;
  BookingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BookingAppointment>> bookAppointment(
      BookingRequest request) async {
    try {
      final booking = await remoteDataSource.bookAppointment(request);
      return Right(booking);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
