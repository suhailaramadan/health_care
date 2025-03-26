import 'package:graduation_project/features/user/booking/data/models/appointment_by_doctor_id_response/appointment_model.dart';

class AppointmentByDoctorIdResponse {
  bool? success;
  String? message;
  List<AppointmentModel>? data;

  AppointmentByDoctorIdResponse({this.success, this.message, this.data});

  factory AppointmentByDoctorIdResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentByDoctorIdResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
