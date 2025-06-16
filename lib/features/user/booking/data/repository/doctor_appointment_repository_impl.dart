import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/constants.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_api_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_response/booking_data_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DoctorAppointmentRepository)
class DoctorAppointmentsRepositoryImpl implements DoctorAppointmentRepository {
  final AppointmentRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  DoctorAppointmentsRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<Either<Failure, List<DoctorsAppointmentModel>>>
      getDoctorAppointments() async {
    try {
      // final token = await CacheConstants.tokenKey;
      final appointments = await remoteDataSource.getDotorsAppointment();
      return Right(appointments);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DoctorsAppointmentModel>> createAppoitment(
      CreateRequestModel request) async {
    try {
      final token = await localDataSource.getToken();
      final result =
          await remoteDataSource.createAppointment(request, token ?? '');
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteBookingEntity>> deleteAppointment(int id
      // {required int day,
      // required String startTime,
      // required String endTime,
      // required int duration}
      ) async {
    try {
      final appointment = await remoteDataSource.deleteappointment(id);
      // day: day, startTime: startTime, endTime: endTime, duration: duration);
      return Right(appointment);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DoctorsAppointmentModel>> updateAppointment(
      UpdateAppointmentRequest request) async {
    try {
      final response = await remoteDataSource.updateAppointment(request);
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
