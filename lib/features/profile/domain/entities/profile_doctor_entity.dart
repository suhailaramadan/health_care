class ProfileDoctorEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? college;
  String? specialty;
  String? description;
  String? phoneNumber;
  String? nationalId;
  int? clinicId;
  String? clinicName;
  String? imageUrl;
  ProfileDoctorEntity(
      {required this.clinicId,
      required this.clinicName,
      required this.college,
      required this.description,
      required this.email,
      required this.firstName,
      required this.imageUrl,
      required this.id,
      required this.lastName,
      required this.nationalId,
      required this.phoneNumber,
      required this.specialty});
}
