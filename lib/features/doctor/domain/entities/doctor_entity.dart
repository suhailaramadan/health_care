class DoctorEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? college;
  String? specialty;
  String? description;
  String? phoneNumber;
  int? clinicId;
  dynamic clinicName;
  String? imageUrl;
  DoctorEntity(
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.clinicId,
      this.clinicName,
      this.description,
      this.imageUrl,
      this.phoneNumber,
      this.specialty);
}
