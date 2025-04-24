import 'package:dio/dio.dart';
import 'package:graduation_project/core/resources/image_manager.dart';

class UpdateRequest {
  final String firstName;
  final String lastName;
  final String collage;
  final int nationalId;
  final String email;
  final int phoneNumber;
  final String imageUrl;
  UpdateRequest(
      {required this.collage,
      required this.firstName,
      required this.lastName,
      required this.nationalId,
      required this.email,
      required this.imageUrl,
      required this.phoneNumber});
  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "NationalID": nationalId,
      "PhoneNumber": phoneNumber,
      "College": collage,
      "ImageFile":
          MultipartFile.fromFile(imageUrl, filename: ImageManager.profile),
    });
  }
}
