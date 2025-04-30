import 'package:graduation_project/features/user/booking/data/models/doctors_appointment_response/doctors_appointment_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/doctor_appointment_entity.dart';
import 'package:graduation_project/features/user/booking/domain/repository/doctor_appointments_repository.dart';

extension DoctorsAppointmentsMapper on DoctorsAppointmentModel {
  DoctorAppointmentEntity get onEntity => DoctorAppointmentEntity(
      day: day,
      doctorId: doctorId,
      duration: duration,
      endTime: endTime,
      id: id,
      isAvailable: isAvailable,
      startTime: startTime);
}
