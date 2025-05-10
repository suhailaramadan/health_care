import 'add_medical_record_model.dart';

class MedicalRecordAddResponse {
  bool? success;
  String? message;
  AddMedicalRecordModel? data;

  MedicalRecordAddResponse({this.success, this.message, this.data});

  factory MedicalRecordAddResponse.fromJson(Map<String, dynamic> json) {
    return MedicalRecordAddResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddMedicalRecordModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
