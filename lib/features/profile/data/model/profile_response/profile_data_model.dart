class ProfileDataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? college;
  String? phoneNumber;
  String? nationalId;
  String? imageUrl;

  ProfileDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.college,
    this.phoneNumber,
    this.nationalId,
    this.imageUrl,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      ProfileDataModel(
        id: json['id'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        college: json['college'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        nationalId: json['nationalID'] as String?,
        imageUrl: json['imageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'college': college,
        'phoneNumber': phoneNumber,
        'nationalID': nationalId,
        'imageUrl': imageUrl,
      };
}
