import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/booking_patient_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BookingPatientRepository)
class BookingPatientRepositoryImpl implements BookingPatientRepository {
  final BookingRemoteDataSource remoteDataSource;
  BookingPatientRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, BookingPatientResponse>> getBookingpatient(
      String token) async {
    try {
      final booking = await remoteDataSource.getbookingPatient(token);
      return Right(booking);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
