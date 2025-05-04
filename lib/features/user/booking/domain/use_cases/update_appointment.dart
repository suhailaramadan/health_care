import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateAppointmentUseCase {
  final DoctorAppointmentRepository repository;
  UpdateAppointmentUseCase(this.repository);
  Future<Either<Failure, DoctorsAppointmentModel>> call(
      UpdateAppointmentRequest request) {
    return repository.updateAppointment(request);
  }
}
