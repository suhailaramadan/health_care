import 'package:intl/intl.dart';

class Datum {
  int? id;
  String? date;
  String? time;
  String? patientId;
  String? doctorId;
  String? doctorFirstName;
  String? doctorLastName;
  String? clinicName;

  Datum({
    this.id,
    this.date,
    this.time,
    this.patientId,
    this.doctorId,
    this.doctorFirstName,
    this.doctorLastName,
    this.clinicName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

  bool get isUpcoming {
    if (date == null) return false;
    DateTime bookingData = DateFormat('yyyy-MM--dd').parse(date!);
    return bookingData.isAfter(DateTime.now());
  }

  bool get isCancellable {
    if (date == null) return false;
    DateTime bookingDate = DateFormat('yyyy-MM--dd').parse(date!);
    return bookingDate.difference(DateTime.now()).inHours >= 24;
  }
}
