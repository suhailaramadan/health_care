import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_by_id_response/booking_by_id_model.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_by_id_entity.dart';

extension BookingByIdMapper on BookingByIdModel {
  BookingByIdEntity get toEntity => BookingByIdEntity(
      date: date,
      day: day,
      doctorId: doctorId,
      id: id,
      isbooked: isbooked,
      patientId: patientId,
      time: time);
}
