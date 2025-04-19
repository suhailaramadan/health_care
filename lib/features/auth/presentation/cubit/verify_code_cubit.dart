import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
import 'package:graduation_project/features/auth/domain/use_cases/verify_code_use_case.dart';
import 'package:graduation_project/features/auth/presentation/cubit/password_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class VerifyCodeCubit extends Cubit<PasswordStates> {
  final VerifyCodeUseCase verifyCodeUseCase;
  VerifyCodeCubit(this.verifyCodeUseCase) : super(PasswordInitialState());
  Future<void> verifyCode(VerifyCodeRequest request) async {
    emit(PasswordLoading());
    final result = await verifyCodeUseCase(request);
    print("${request.code}-------------------");
    result.fold((failure) => emit(PasswordError(failure.message)),
        (message) => emit(VerifyCodeSuccess(message)));
  }

  // Future<void> resendCode(VerifyCodeRequest request) async {
  //   emit(PasswordLoading());
  //   try {
  //     await verifyCodeUseCase(request.email);
  //   } catch (e) {}
  // }
}
