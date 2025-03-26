class BookingEntity {
  int? id;
  String? date;
  String? time;
  String? patientId;
  String? doctorId;
  String? doctorFirstName;
  String? doctorLastName;
  String? clinicName;
  bool isUpcoming;
  bool isCancellable;

  BookingEntity(
      {this.id,
      this.date,
      this.time,
      this.patientId,
      this.doctorId,
      this.doctorFirstName,
      this.doctorLastName,
      this.clinicName,
      required this.isCancellable,
      required this.isUpcoming});
}
