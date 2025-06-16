// import 'package:dio/dio.dart';
// import 'package:graduation_project/core/resources/image_manager.dart';

// class UpdateRequest {
//   final String? firstName;
//   final String? lastName;
//   final String? collage;
//   final int? nationalId;
//   final String? email;
//   final int? phoneNumber;
//   final String? imageUrl;
//   UpdateRequest(
//       {this.collage,
//       this.firstName,
//       this.lastName,
//       this.nationalId,
//       this.email,
//       this.imageUrl,
//       this.phoneNumber});
//   Future<FormData> toFormData() async {
//     final Map<String, dynamic> data = {};
//     if (firstName != null) data["FirstName"] = firstName;
//     if (lastName != null) data["LastName"] = lastName;
//     if (email != null) data["Email"] = email;
//     if (nationalId != null) data['NationalID'] = nationalId;
//     if (phoneNumber != null) data["PhoneNumber"] = phoneNumber;
//     if (collage != null) data["College"] = collage;
//     if (imageUrl != null && imageUrl!.isNotEmpty) {
//       data["ImageFile"] = await MultipartFile.fromFile(imageUrl!,
//           filename: ImageManager.profile);
//     }
//     print(
//         "$firstName  , $lastName  $email  $collage $imageUrl  $phoneNumber   $nationalId");
//     return FormData.fromMap(data);

//     // return FormData.fromMap({
//     //   "FirstName": firstName,
//     //   "LastName": lastName,
//     //   "Email": email,
//     //   "NationalID": nationalId,
//     //   "PhoneNumber": phoneNumber,
//     //   "College": collage,
//     //   "ImageFile": MultipartFile.fromFile(imageUrl ?? '',
//     //       filename: ImageManager.profile),
//     // });
//   }
// }

import 'package:dio/dio.dart';
import 'package:graduation_project/features/profile/data/model/profile_response/profile_data_model.dart';
import 'package:graduation_project/features/profile/domain/entities/profile_entity.dart';

class UpdateProfileRequest {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? nationalId;
  final String? phoneNumber;
  final String? college;
  final String? imageUrl;

  UpdateProfileRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.nationalId,
    this.phoneNumber,
    this.college,
    this.imageUrl,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      if (firstName != null) 'firstName': firstName,

      if (lastName != null) 'lastName': lastName,
      if (email != null) 'email': email,
      if (college != null) 'college': college,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (nationalId != null) 'nationalID': nationalId,
      if (imageUrl != null)
        "ImageFile": await MultipartFile.fromFile(imageUrl!,
            filename: imageUrl!.split('/').last)
      // "LastName": lastName ?? patientDataModel.lastName,
      // "Email": email ?? patientDataModel.email,
      // "NationalID": nationalId ?? patientDataModel.nationalId,
      // "PhoneNumber": phoneNumber ?? patientDataModel.phoneNumber,
      // "College": college ?? patientDataModel.college,
      // if (imageUrl != null)
      //   "ImageUrl": await MultipartFile.fromFile(imageUrl!,
      //       filename: imageUrl!.split('/').last)
    });
    // final Map<String, dynamic> data = {};

    // if (firstName != null) data["FirstName"] = firstName;
    // if (lastName != null) data["LastName"] = lastName;
    // if (email != null) data["Email"] = email;
    // if (nationalId != null) data["NationalID"] = nationalId;
    // if (phoneNumber != null) data["PhoneNumber"] = phoneNumber;
    // if (college != null) data["College"] = college;

    // if (imageUrl != null && imageUrl!.isNotEmpty) {
    //   data["ImageFile"] = await MultipartFile.fromFile(
    //     imageUrl!,
    //     filename: "profile.jpg",
    //   );
    // }

    // return FormData.fromMap(data);
  }
}
