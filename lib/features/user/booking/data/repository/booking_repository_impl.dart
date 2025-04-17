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
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart';

import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/mapper/delete_booking_mapper.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/booking_appointment.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_request.dart';
import 'package:graduation_project/features/user/booking/data/models/delete_booking_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: BookingRepository)
class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  BookingRepositoryImpl(this.remoteDataSource, this.localDataSource);

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

  @override
  Future<Either<Failure, DeleteBookingEntity>> deleteBooking(
      int bookingId) async {
    try {
      // final token = await localDataSource.getToken();
      final pref = await SharedPreferences.getInstance();
      final token = pref.getString(CacheConstants.tokenKey);
      if (token == null) {
        throw RemoteException("فشل الإتصال بالخادم");
      }
      final response = await remoteDataSource.deleteBooking(bookingId, token);
      // final response = await remoteDataSource.deleteBooking(bookingId, token!);
      //   if (response.success == true && response.data == true) {
      return Right(response.toEntity);
      //   } else {
      //     return Left(Failure(response.message ?? 'حدث خطأ أثناء الحذف'));
      //   }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
