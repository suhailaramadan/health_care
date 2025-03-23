import 'package:graduation_project/features/doctor/data/model/doctor_response/doctor_model.dart';

class DoctorResponse {
  bool? success;
  String? message;
  List<DoctorModel>? data;

  DoctorResponse({this.success, this.message, this.data});

  factory DoctorResponse.fromJson(Map<String, dynamic> json) {
    return DoctorResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
