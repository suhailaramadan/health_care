import 'package:graduation_project/features/user/booking/data/models/booking_response/booking_appointment/data.dart';
import 'package:graduation_project/features/user/booking/domain/entities/booking_entity.dart';

extension BookingMapper on Data {
  BookingEntity get toEntity => BookingEntity(
      date: date, doctorId: doctorId, isbooked: isbooked, time: time);
}
