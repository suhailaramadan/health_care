import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/models/password/change_password_request.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChangePasswordUseCase {
  final AuthRepository authRepository;
  ChangePasswordUseCase(this.authRepository);
  Future<Either<Failure, String>> call(ChangePasswordRequest request) async {
    return await authRepository.changePassword(request);
  }
}
