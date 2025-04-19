import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/models/password/forget_password_request.dart';
import 'package:graduation_project/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class ForgetPasswordCubit extends Cubit<PasswordStates> {
  final ForgetPasswordUseCase useCase;
  ForgetPasswordCubit(this.useCase) : super(PasswordInitialState());
  Future<void> forgetPassword(String email) async {
    emit(PasswordLoading());
    // try {
    final result = await useCase(ForgetPasswordRequest(email: email));
    result.fold((failure) {
      emit(PasswordError("البريد الإلكترونى غير صالح"));
    }, (_) {
      emit(PasswordSuccess());
    });
  }
}
