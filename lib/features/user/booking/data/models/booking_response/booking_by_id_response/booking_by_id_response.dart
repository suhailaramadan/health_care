import 'booking_by_id_model.dart';

class BookingByIdResponse {
  bool? success;
  String? message;
  BookingByIdModel? data;

  BookingByIdResponse({this.success, this.message, this.data});

  factory BookingByIdResponse.fromJson(Map<String, dynamic> json) {
    return BookingByIdResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BookingByIdModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
