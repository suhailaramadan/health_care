abstract class PasswordStates {}

class PasswordInitialState extends PasswordStates {}

class PasswordLoading extends PasswordStates {}

class PasswordSuccess extends PasswordStates {}

class VerifyCodeSuccess extends PasswordStates {
  final String message;
  VerifyCodeSuccess(this.message);
}

class ResetPasswordSuccess extends PasswordStates {
  final String message;
  ResetPasswordSuccess(this.message);
}

class ChangePasswordSuccess extends PasswordStates {
  final String message;
  ChangePasswordSuccess(this.message);
}

class PasswordError extends PasswordStates {
  final String message;
  PasswordError(this.message);
}
