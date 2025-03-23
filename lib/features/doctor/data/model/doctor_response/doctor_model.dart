class DoctorModel {
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
  dynamic clinicName;
  String? imageUrl;

  DoctorModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.college,
    this.specialty,
    this.description,
    this.phoneNumber,
    this.nationalId,
    this.clinicId,
    this.clinicName,
    this.imageUrl,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        id: json['id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        college: json['college'] as String?,
        specialty: json['specialty'] as String?,
        description: json['description'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        nationalId: json['nationalID'] as String?,
        clinicId: json['clinicId'] as int?,
        // clinicId: json['clinicId'] is int
        //     ? json['clinicId'] as int
        //     : int.tryParse(json['clinicId'].toString()) ?? 0,

        clinicName: json['clinicName'] as dynamic,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'college': college,
        'specialty': specialty,
        'description': description,
        'phoneNumber': phoneNumber,
        'nationalID': nationalId,
        'clinicId': clinicId,
        'clinicName': clinicName,
        'imageUrl': imageUrl,
      };
}
