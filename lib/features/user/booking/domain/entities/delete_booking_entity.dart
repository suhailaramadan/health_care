import 'package:graduation_project/features/user/booking/data/models/delete_booking_response.dart';

class DeleteBookingEntity {
  final bool? success;
  final String? message;
  final bool? data;
  DeleteBookingEntity(
      {required this.data, required this.message, required this.success});

  factory DeleteBookingEntity.fromJson(Map<String, dynamic> json) {
    return DeleteBookingEntity(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as bool?,
    );
  }
}
