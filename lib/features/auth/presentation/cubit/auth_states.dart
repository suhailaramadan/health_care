abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class RegisterLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {}

class RegisterError extends AuthStates {
  final String message;
  RegisterError(this.message);
}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  final String token;
  final String role;
  final String userImage;
  final String firstName;
  final String lastName;
  LoginSuccess(
      {required this.userImage,
      required this.firstName,
      required this.lastName,
      required this.role,
      required this.token});
}

class LoginError extends AuthStates {
  final String message;
  LoginError(this.message);
}
