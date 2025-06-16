class BookingPatientModel {
  int? id;
  String? date;
  int? day;
  String? time;
  String? patientId;
  String? doctorId;
  String? doctorFirstName;
  String? doctorLastName;
  String? clinicName;
  String? doctorImageUrl;

  BookingPatientModel({
    this.id,
    this.date,
    this.day,
    this.time,
    this.patientId,
    this.doctorId,
    this.doctorFirstName,
    this.doctorLastName,
    this.clinicName,
    this.doctorImageUrl,
  });

  factory BookingPatientModel.fromJson(Map<String, dynamic> json) =>
      BookingPatientModel(
        id: json['id'] as int?,
        date: json['date'] as String?,
        day: json['day'] as int?,
        time: json['time'] as String?,
        patientId: json['patientId'] as String?,
        doctorId: json['doctorId'] as String?,
        doctorFirstName: json['doctorFirstName'] as String?,
        doctorLastName: json['doctorLastName'] as String?,
        clinicName: json['clinicName'] as String?,
        doctorImageUrl: json['doctorImageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'day': day,
        'time': time,
        'patientId': patientId,
        'doctorId': doctorId,
        'doctorFirstName': doctorFirstName,
        'doctorLastName': doctorLastName,
        'clinicName': clinicName,
        'doctorImageUrl': doctorImageUrl,
      };
}
