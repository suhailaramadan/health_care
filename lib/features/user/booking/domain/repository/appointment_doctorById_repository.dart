import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';

abstract class AppointmentDoctorByIdRepository {
  Future<Either<Failure, List<AppointmentEntity>>> getAppointmentDoctorById(
      String doctorId);
}
