class ProfileEntity {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? college;
  String? phoneNumber;
  String? nationalId;
  String? imageUrl;
  ProfileEntity(this.id, this.firstName, this.lastName, this.email,
      this.college, this.phoneNumber, this.nationalId, this.imageUrl);
  // factory ProfileEntity.fromJson(Map<String, dynamic> json) => ProfileEntity(
  //       // id:
  //       json['id'] as String?,
  //       // firstName:
  //       json['firstName'] as String?,
  //       // lastName:
  //       json['lastName'] as String?,
  //       // email:
  //       json['email'] as String?,
  //       // college:
  //       json['college'] as String?,
  //       // phoneNumber:
  //       json['phoneNumber'] as String?,
  //       // nationalId:
  //       json['nationalID'] as String?,
  //       // imageUrl:
  //       json['imageUrl'] as dynamic,
  //     );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'firstName': firstName,
  //       'lastName': lastName,
  //       'email': email,
  //       'college': college,
  //       'phoneNumber': phoneNumber,
  //       'nationalID': nationalId,
  //       'imageUrl': imageUrl,
  //     };
}
