import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/password/reset_password_request.dart';
import 'package:graduation_project/features/auth/domain/use_cases/reset_password.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class ResetPasswordCubit extends Cubit<PasswordStates> {
  final ResetPasswordUseCae resetPasswordUseCae;
  ResetPasswordCubit(this.resetPasswordUseCae) : super(PasswordInitialState());
  Future<void> resetPassword(ResetPasswordRequest request) async {
    print("loading");

    emit(PasswordLoading());
    final result = await resetPasswordUseCae(request);
    print("resultttttttt $result");
    result.fold((failure) => emit(PasswordError(failure.message)),
        (message) => emit(ResetPasswordSuccess(message)));
  }
}
