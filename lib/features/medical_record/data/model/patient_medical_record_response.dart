class PatientMedicalRecordResponse {
  bool? success;
  String? message;
  List<dynamic>? data;

  PatientMedicalRecordResponse({this.success, this.message, this.data});

  factory PatientMedicalRecordResponse.fromJson(Map<String, dynamic> json) {
    return PatientMedicalRecordResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data,
      };
}
