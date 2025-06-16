import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_response/booking_data_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/create_request_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/update_appointment_request.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';
import 'package:graduation_project/features/user/booking/domain/entities/doctor_appointment_entity.dart';
import 'package:injectable/injectable.dart';

abstract class DoctorAppointmentRepository {
  Future<Either<Failure, List<DoctorsAppointmentModel>>>
      getDoctorAppointments();
  Future<Either<Failure, DoctorsAppointmentModel>> createAppoitment(
      CreateRequestModel request);
  Future<Either<Failure, DeleteBookingEntity>> deleteAppointment(
    int id,
    // {required int day,
    // required String startTime,
    // required String endTime,
    // required int duration}
  );
  Future<Either<Failure, DoctorsAppointmentModel>> updateAppointment(
      UpdateAppointmentRequest request);
}
