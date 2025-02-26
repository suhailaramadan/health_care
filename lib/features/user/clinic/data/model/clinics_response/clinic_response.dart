import 'package:graduation_project/features/user/clinic/data/model/clinics_response/clinic_model.dart';

class ClinicsResponse {
  bool? success;
  String? message;
  List<ClinicModel>? data;

  ClinicsResponse({this.success, this.message, this.data});

  factory ClinicsResponse.fromJson(Map<String, dynamic> json) {
    return ClinicsResponse(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => ClinicModel.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
