import 'package:graduation_project/features/user/booking/data/models/datum.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';

extension BookingMapper on Datum {
  BookingEntity get toEntity => BookingEntity(
      clinicName: clinicName,
      id: id,
      date: date,
      doctorFirstName: doctorFirstName,
      doctorId: doctorId,
      doctorLastName: doctorLastName,
      patientId: patientId,
      time: time,
      isCancellable: isCancellable,
      isUpcoming: isUpcoming);
}
