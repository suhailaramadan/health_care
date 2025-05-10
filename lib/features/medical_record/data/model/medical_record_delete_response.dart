class MedicalRecordDeleteResponse {
  bool? success;
  String? message;
  bool? data;

  MedicalRecordDeleteResponse({this.success, this.message, this.data});

  factory MedicalRecordDeleteResponse.fromJson(Map<String, dynamic> json) {
    return MedicalRecordDeleteResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data,
      };
}
