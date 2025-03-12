import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';

class RegisterResponse extends UserEntity {
  bool? succeeded;
  List<dynamic>? errors;

  RegisterResponse({this.succeeded, this.errors})
      : super(
          success: succeeded,
          errors: errors,
        );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      succeeded: json['succeeded'] as bool?,
      // errors: json['errors'] as List<dynamic>?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    );
  }
}
