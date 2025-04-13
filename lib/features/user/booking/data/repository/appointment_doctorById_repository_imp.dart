import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/data_source/remote/appointments/appointment_remote_data_source.dart';
import 'package:graduation_project/features/user/booking/data/mapper/appointment_mapper.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppointmentDoctorByIdRepository)
class AppointmentDoctorByIdRepositoryImpl
    extends AppointmentDoctorByIdRepository {
  final AppointmentRemoteDataSource _remoteDataSource;
  AppointmentDoctorByIdRepositoryImpl(this._remoteDataSource);
  //  Future<Either<Failure, List<AppointmentEntity>>> getAppointmentDoctorById(
  @override
  Future<Either<Failure, List<AppointmentEntity>>> getAppointmentDoctorById(
      String doctorId) async {
    try {
      final result = await _remoteDataSource.getAppointmentDoctorById(doctorId);
      final appointments = result.data?.toEntityList ?? [];
      return Right(appointments);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
