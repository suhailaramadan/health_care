import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/models/password/change_password_request.dart';
import 'package:graduation_project/features/auth/domain/use_cases/change_password_use_case.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChangePasswordCubit extends Cubit<PasswordStates> {
  final ChangePasswordUseCase changePasswordUseCase;
  ChangePasswordCubit(this.changePasswordUseCase)
      : super(PasswordInitialState());
  Future<void> changePassword(ChangePasswordRequest request) async {
    emit(PasswordLoading());
    final result = await changePasswordUseCase(request);
    result.fold((failure) => emit(PasswordError(failure.message)),
        (message) => emit(ChangePasswordSuccess(message)));
  }
}
