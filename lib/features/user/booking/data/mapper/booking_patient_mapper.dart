import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_patient_response/booking_patient_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_patient_entity.dart';

extension BookingPatientMapper on BookingPatientModel {
  BookingPatientEntity get toEntity => BookingPatientEntity(
      clinicName: clinicName,
      id: id,
      date: date,
      doctorFirstName: doctorFirstName,
      doctorLastName: doctorLastName,
      doctorId: doctorId,
      patientId: patientId,
      time: time);
}
