import 'package:flutter/material.dart';

class BookingDoctorEntity {
  int? id;
  String? date;
  int? day;
  String? time;
  String? doctorId;
  String? patientId;
  String? patientFirstName;
  String? patientLastName;
  dynamic patientImageUrl;
  BookingDoctorEntity(
      {required this.date,
      required this.day,
      required this.doctorId,
      required this.id,
      required this.patientFirstName,
      required this.patientId,
      required this.patientImageUrl,
      required this.patientLastName,
      required this.time});
}
