import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateAppointmentUseCase {
  final DoctorAppointmentRepository doctorAppointmentRepository;
  CreateAppointmentUseCase(this.doctorAppointmentRepository);
  Future<Either<Failure, DoctorsAppointmentModel>> call(
      CreateRequestModel request) {
    return doctorAppointmentRepository.createAppoitment(request);
  }
}
