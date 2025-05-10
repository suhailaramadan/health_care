class MedicalRecordRequest {
  int? bookingsId;
  String? diagnosis;
  String? treatment;
  String? notes;
  MedicalRecordRequest(
      {required this.bookingsId,
      required this.diagnosis,
      required this.notes,
      required this.treatment});
}
