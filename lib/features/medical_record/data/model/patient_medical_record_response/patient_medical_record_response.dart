import 'patient_data.dart';

class PatientMedicalRecordResponse {
  bool? success;
  String? message;
  List<PatientData>? data;

  PatientMedicalRecordResponse({this.success, this.message, this.data});

  factory PatientMedicalRecordResponse.fromJson(Map<String, dynamic> json) {
    return PatientMedicalRecordResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PatientData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
