import 'booking_patient_model.dart';

class BookingPatientResponse {
  bool? success;
  String? message;
  List<BookingPatientModel>? data;

  BookingPatientResponse({this.success, this.message, this.data});

  factory BookingPatientResponse.fromJson(Map<String, dynamic> json) {
    return BookingPatientResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BookingPatientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
