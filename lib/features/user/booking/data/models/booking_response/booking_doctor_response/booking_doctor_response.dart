import 'booking_doctor_model.dart';

class BookingDoctorResponse {
  bool? success;
  String? message;
  List<BookingDoctorModel>? data;

  BookingDoctorResponse({this.success, this.message, this.data});

  factory BookingDoctorResponse.fromJson(Map<String, dynamic> json) {
    return BookingDoctorResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BookingDoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  where(bool Function(dynamic b) param0) {}
}
