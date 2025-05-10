class MedicalRecordAddEntity {
  int? bookingsId;
  String? diagnosis;
  String? treatment;
  String? notes;
  MedicalRecordAddEntity({
    required this.bookingsId,
    required this.diagnosis,
    required this.notes,
    required this.treatment,
  });
  Map<String, dynamic> toJson() => {
        'bookingsId': bookingsId,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'notes': notes,
      };
}
