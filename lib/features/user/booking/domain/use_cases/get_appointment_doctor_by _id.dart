import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/appointment_doctorById_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAppointmentDoctorById {
  final AppointmentDoctorByIdRepository _appointmentDoctorByIdRepository;
  const GetAppointmentDoctorById(this._appointmentDoctorByIdRepository);
  Future<Either<Failure, List<AppointmentEntity>>> call(String doctorId) =>
      _appointmentDoctorByIdRepository.getAppointmentDoctorById(doctorId);
}
