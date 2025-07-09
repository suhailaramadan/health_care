import 'package:dio/dio.dart';
import 'package:graduation_project/core/resources/image_manager.dart';

class RegisterRequest {
  final String firstName;
  final String lastName;
  final String collage;
  final int nationalId;
  final String email;
  final String password;
  final String confirmPassword;
  final int phoneNumber;
  final String imageUrl;
  RegisterRequest(
      {required this.collage,
      required this.firstName,
      required this.lastName,
      required this.nationalId,
      required this.email,
      required this.imageUrl,
      required this.password,
      required this.confirmPassword,
      required this.phoneNumber});
  Future<FormData> toFormData() async {
    final formDataMap = {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "NationalID": nationalId,
      "Password": password,
      "ConfirmPassword": confirmPassword,
      "PhoneNumber": phoneNumber,
      "College": collage,
    };

    final formData = FormData.fromMap(formDataMap);

    if (imageUrl.isNotEmpty) {
      formData.files.add(MapEntry(
        "ImageFile",
        await MultipartFile.fromFile(imageUrl,
            filename: imageUrl.split('/').last),
      ));
    }

    return formData;
  }
  // return FormData.fromMap({
  //   "FirstName": firstName,
  //   "LastName": lastName,
  //   "Email": email,
  //   "NationalID": nationalId,
  //   "Password": password,
  //   "ConfirmPassword": confirmPassword,
  //   "PhoneNumber": phoneNumber,
  //   "College": collage,
  //   if(imageUrl.isNotEmpty)
  //   "ImageFile":
  //      await MultipartFile.fromFile(imageUrl, filename: ImageManager.profile),
  // });
}
// }
