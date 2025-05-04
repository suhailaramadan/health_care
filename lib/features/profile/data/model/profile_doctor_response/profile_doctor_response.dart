import 'package:graduation_project/features/profile/data/model/profile_doctor_response/profile_doctor_model.dart';

class ProfileDoctorResponse {
  bool? success;
  String? message;
  ProfileDoctorModel? data;

  ProfileDoctorResponse({this.success, this.message, this.data});

  factory ProfileDoctorResponse.fromJson(Map<String, dynamic> json) {
    return ProfileDoctorResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileDoctorModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
