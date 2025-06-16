import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_by_id_response/booking_by_id_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_response.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_response/booking_data_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';

abstract class BookingPatientRepository {
  Future<Either<Failure, BookingPatientResponse>> getBookingpatient();
  Future<Either<Failure, BookingByIdResponse>> getBokkingById(int id);
  Future<Either<Failure, List<BookingDataModel>>> getAllBookings();
}
