import 'package:graduation_project/features/medical_record/data/model/update_medical_record_response/update_medical_record_model.dart';

class UpdateMedicalRecordResponse {
  bool? success;
  String? message;
  UpdateMedicalRecordModel? data;
  UpdateMedicalRecordResponse({this.success, this.message, this.data});
  factory UpdateMedicalRecordResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMedicalRecordResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UpdateMedicalRecordModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };
}
