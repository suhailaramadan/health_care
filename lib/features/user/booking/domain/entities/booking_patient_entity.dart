class BookingPatientEntity {
  int? id;
  String? date;
  String? time;
  String? patientId;
  String? doctorId;
  String? doctorFirstName;
  String? doctorLastName;
  String? clinicName;

  BookingPatientEntity({
    this.id,
    this.date,
    this.time,
    this.patientId,
    this.doctorId,
    this.doctorFirstName,
    this.doctorLastName,
    this.clinicName,
  });
}
