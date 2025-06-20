class DoctorDashBoardResponse {
  String? doctorName;
  String? profileImage;
  String? greeting;
  int? todayAppointmentsCount;
  dynamic nextAppointmentTime;
  int? totalAppointments;
  int? totalBookings;

  DoctorDashBoardResponse({
    this.doctorName,
    this.profileImage,
    this.greeting,
    this.todayAppointmentsCount,
    this.nextAppointmentTime,
    this.totalAppointments,
    this.totalBookings,
  });

  factory DoctorDashBoardResponse.fromJson(Map<String, dynamic> json) {
    return DoctorDashBoardResponse(
      doctorName: json['doctorName'] as String?,
      profileImage: json['profileImage'] as String?,
      greeting: json['greeting'] as String?,
      todayAppointmentsCount: json['todayAppointmentsCount'] as int?,
      nextAppointmentTime: json['nextAppointmentTime'] as dynamic,
      totalAppointments: json['totalAppointments'] as int?,
      totalBookings: json['totalBookings'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'doctorName': doctorName,
        'profileImage': profileImage,
        'greeting': greeting,
        'todayAppointmentsCount': todayAppointmentsCount,
        'nextAppointmentTime': nextAppointmentTime,
        'totalAppointments': totalAppointments,
        'totalBookings': totalBookings,
      };
}
