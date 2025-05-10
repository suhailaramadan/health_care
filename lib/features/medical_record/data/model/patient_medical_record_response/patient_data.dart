class PatientData {
  int? id;
  String? dateOfVisit;
  String? diagnosis;
  String? treatment;
  String? notes;
  String? patientId;
  String? doctorId;
  String? doctorName;
  String? clinicName;

  PatientData({
    this.id,
    this.dateOfVisit,
    this.diagnosis,
    this.treatment,
    this.notes,
    this.patientId,
    this.doctorId,
    this.doctorName,
    this.clinicName,
  });

  factory PatientData.fromJson(Map<String, dynamic> json) => PatientData(
        id: json['id'] as int?,
        dateOfVisit: json['dateOfVisit'] as String?,
        diagnosis: json['diagnosis'] as String?,
        treatment: json['treatment'] as String?,
        notes: json['notes'] as String?,
        patientId: json['patientId'] as String?,
        doctorId: json['doctorId'] as String?,
        doctorName: json['doctorName'] as String?,
        clinicName: json['clinicName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dateOfVisit': dateOfVisit,
        'diagnosis': diagnosis,
        'treatment': treatment,
        'notes': notes,
        'patientId': patientId,
        'doctorId': doctorId,
        'doctorName': doctorName,
        'clinicName': clinicName,
      };
}
