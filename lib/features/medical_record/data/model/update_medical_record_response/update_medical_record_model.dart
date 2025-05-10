class UpdateMedicalRecordModel {
  String? diagnosis;
  String? treatment;
  String? notes;

  UpdateMedicalRecordModel({this.diagnosis, this.treatment, this.notes});

  factory UpdateMedicalRecordModel.fromJson(Map<String, dynamic> json) =>
      UpdateMedicalRecordModel(
        diagnosis: json['diagnosis'] as String?,
        treatment: json['treatment'] as String?,
        notes: json['notes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'diagnosis': diagnosis,
        'treatment': treatment,
        'notes': notes,
      };
}
