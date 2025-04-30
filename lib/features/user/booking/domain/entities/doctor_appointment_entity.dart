class DoctorAppointmentEntity {
  int? id;
  int? day;
  String? startTime;
  String? endTime;
  int? duration;
  bool? isAvailable;
  String? doctorId;

  DoctorAppointmentEntity({
    this.id,
    this.day,
    this.startTime,
    this.endTime,
    this.duration,
    this.isAvailable,
    this.doctorId,
  });
}
