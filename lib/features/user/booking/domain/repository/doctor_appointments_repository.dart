import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/doctor_appointment_entity.dart';
import 'package:injectable/injectable.dart';

abstract class DoctorAppointmentRepository {
  Future<Either<Failure, List<DoctorsAppointmentModel>>>
      getDoctorAppointments();
  Future<Either<Failure, DoctorsAppointmentModel>> createAppoitment(
      CreateRequestModel request);
}
