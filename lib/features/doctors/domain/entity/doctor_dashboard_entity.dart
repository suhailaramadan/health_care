class DoctorDashboardEntity {
  String? doctorName;
  String? profileImage;
  String? greeting;
  int? todayAppointmentsCount;
  dynamic nextAppointmentTime;
  int? totalAppointments;
  int? totalBookings;
  DoctorDashboardEntity(
      {required this.doctorName,
      required this.greeting,
      required this.nextAppointmentTime,
      required this.profileImage,
      required this.todayAppointmentsCount,
      required this.totalAppointments,
      required this.totalBookings});
}
