import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/password/reset_password_request.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ResetPasswordUseCae {
  final AuthRepository authRepository;
  ResetPasswordUseCae(this.authRepository);
  Future<Either<Failure, String>> call(ResetPasswordRequest request) async =>
      await authRepository.resetPassword(request);
}
