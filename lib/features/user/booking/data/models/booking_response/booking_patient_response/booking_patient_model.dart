import 'package:graduation_project/features/user/booking/data/data_source/remote/booking/booking_api_remote_data_source.dart';

class BookingPatientModel {
  int? id;
  String? date;
  String? time;
  String? patientId;
  String? doctorId;
  String? doctorFirstName;
  String? doctorLastName;
  String? clinicName;

  BookingPatientModel({
    this.id,
    this.date,
    this.time,
    this.patientId,
    this.doctorId,
    this.doctorFirstName,
    this.doctorLastName,
    this.clinicName,
  });

  factory BookingPatientModel.fromJson(Map<String, dynamic> json) =>
      BookingPatientModel(
        id: json['id'] as int?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        patientId: json['patientId'] as String?,
        doctorId: json['doctorId'] as String?,
        doctorFirstName: json['doctorFirstName'] as String?,
        doctorLastName: json['doctorLastName'] as String?,
        clinicName: json['clinicName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'time': time,
        'patientId': patientId,
        'doctorId': doctorId,
        'doctorFirstName': doctorFirstName,
        'doctorLastName': doctorLastName,
        'clinicName': clinicName,
      };
}
