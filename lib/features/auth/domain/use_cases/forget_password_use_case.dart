import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/password/forget_password_request.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ForgetPasswordUseCase {
  final AuthRepository repository;
  ForgetPasswordUseCase(this.repository);

  Future<Either<Failure, void>> call(ForgetPasswordRequest request) async =>
      await repository.forgetPassword(request);
}
