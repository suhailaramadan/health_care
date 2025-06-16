class BookingByIdEntity {
  int? id;
  String? date;
  int? day;
  String? time;
  bool? isbooked;
  String? patientId;
  String? doctorId;
  BookingByIdEntity(
      {required this.date,
      required this.day,
      required this.doctorId,
      required this.id,
      required this.isbooked,
      required this.patientId,
      required this.time});
}
