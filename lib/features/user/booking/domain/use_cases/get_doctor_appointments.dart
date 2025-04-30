import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/repository/doctor_appointment_repository_impl.dart';
import 'package:graduation_project/features/user/booking/domain/entities/appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/doctor_appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetDoctorsAppointments {
  final DoctorAppointmentRepository _appointmentRepository;
  const GetDoctorsAppointments(this._appointmentRepository);
  Future<Either<Failure, List<DoctorsAppointmentModel>>> call() =>
      _appointmentRepository.getDoctorAppointments();
}
