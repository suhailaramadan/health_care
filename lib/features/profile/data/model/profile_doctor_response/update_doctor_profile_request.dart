import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_doctor_entity.dart';

class UpdateDoctorProfileRequest {
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
  UpdateDoctorProfileRequest(
      {required this.clinicId,
      required this.clinicName,
      required this.college,
      required this.description,
      required this.email,
      required this.firstName,
      required this.id,
      required this.imageUrl,
      required this.lastName,
      required this.nationalId,
      required this.phoneNumber,
      required this.specialty});

  // // 'imageUrl': imageUrl,
  Future<FormData> toFormData() async {
    final formMap = <String, dynamic>{
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (email != null) 'email': email,
      if (college != null) 'college': college,
      if (specialty != null) 'specialty': specialty,
      if (description != null) 'description': description,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (clinicId != null) 'clinicId': clinicId,
      if (nationalId != null) 'nationalID': nationalId,
      if (clinicName != null) 'clinicName': clinicName,
      if (imageUrl != null)
        "ImageUrl": await MultipartFile.fromFile(imageUrl!,
            filename: imageUrl!.split('/').last)
    };

    return FormData.fromMap(formMap);
    // final map = {
    //   'firstName': firstName ?? profileDoctorEntity.firstName,
    //   'lastName': lastName ?? profileDoctorEntity.lastName,
    //   'email': email ?? profileDoctorEntity.email,
    //   'college': college ?? profileDoctorEntity.college,
    //   'specialty': specialty ?? profileDoctorEntity.specialty,
    //   'description': description ?? profileDoctorEntity.description,
    //   'phoneNumber': phoneNumber ?? profileDoctorEntity.phoneNumber,
    //   'nationalID': nationalId ?? profileDoctorEntity.nationalId,
    //   'clinicId': clinicId ?? profileDoctorEntity.clinicId,
    //   'clinicName': clinicName ?? profileDoctorEntity.clinicName,
    // };
    // if (imageUrl != null) {
    //   map['imageUrl'] =
    //       await MultipartFile.fromFile(imageUrl!, filename: 'image.jpg');
    // }
    // return FormData.fromMap(map);
  }
}
