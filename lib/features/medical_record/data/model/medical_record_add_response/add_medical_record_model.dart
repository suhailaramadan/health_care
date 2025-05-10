class AddMedicalRecordModel {
  int? bookingsId;
  String? diagnosis;
  String? treatment;
  String? notes;

  AddMedicalRecordModel(
      {this.bookingsId, this.diagnosis, this.treatment, this.notes});

  factory AddMedicalRecordModel.fromJson(Map<String, dynamic> json) =>
      AddMedicalRecordModel(
        bookingsId: json['bookingsId'] as int?,
        diagnosis: json['diagnosis'] as String?,
        treatment: json['treatment'] as String?,
        notes: json['notes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'bookingsId': bookingsId,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'notes': notes,
      };
}
