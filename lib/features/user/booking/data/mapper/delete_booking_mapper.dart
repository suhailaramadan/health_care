import 'package:graduation_project/features/user/booking/data/models/delete_booking_response.dart';
import 'package:graduation_project/features/user/booking/domain/entities/delete_booking_entity.dart';

extension DeleteBookingMapper on DeleteBookingResponse {
  DeleteBookingEntity get toEntity =>
      DeleteBookingEntity(data: data, message: message, success: success);
}
