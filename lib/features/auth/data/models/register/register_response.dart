class RegisterResponse {
  bool? succeeded;
  List<dynamic>? errors;

  RegisterResponse({this.succeeded, this.errors});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      succeeded: json['succeeded'] as bool?,
      errors: json['errors'] as List<dynamic>?,
    );
  }
}
