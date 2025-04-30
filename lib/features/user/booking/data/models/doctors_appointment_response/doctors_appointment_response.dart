import 'doctors_appointment_model.dart';

class DoctorsAppointmentResponse {
  bool? success;
  String? message;
  List<DoctorsAppointmentModel>? data;

  DoctorsAppointmentResponse({this.success, this.message, this.data});

  factory DoctorsAppointmentResponse.fromJson(Map<String, dynamic> json) {
    return DoctorsAppointmentResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              DoctorsAppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
