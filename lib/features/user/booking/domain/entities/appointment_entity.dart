class AppointmentEntity {
  final String date;
  final String day;
  final List<String> availableSlots;

  const AppointmentEntity({
    required this.date,
    required this.day,
    required this.availableSlots,
  });
}
