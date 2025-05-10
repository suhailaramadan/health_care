import 'package:flutter/material.dart';

class MedicalRecordPatientEntity {
  int? id;
  String? dateOfVisit;
  String? diagnosis;
  String? treatment;
  String? notes;
  String? patientId;
  String? doctorId;
  String? doctorName;
  String? clinicName;
  MedicalRecordPatientEntity(
      {required this.clinicName,
      required this.dateOfVisit,
      required this.diagnosis,
      required this.doctorId,
      required this.doctorName,
      required this.id,
      required this.notes,
      required this.patientId,
      required this.treatment});
}
