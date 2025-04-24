import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/password/change_password_request.dart';
import 'package:graduation_project/features/auth/data/models/password/forget_password_request.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/login/login_response.dart';
import 'package:graduation_project/features/auth/data/models/password/reset_password_request.dart';
import 'package:graduation_project/features/auth/data/models/password/verify_code_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_response.dart';
import 'package:graduation_project/features/auth/domain/entity/password_entity.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, UserEntity>> register(RegisterRequest request) async {
    try {
      final response = await remoteDataSource.register(request);
      return right(response);
    } on AppException catch (exception) {
      return left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(LoginRequest request) async {
    try {
      final response = await remoteDataSource.login(request);
      await localDataSource.saveToken(response.token!, response.role!);
      return Right(response);
    } on AppException catch (exception) {
      return left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword(
      ForgetPasswordRequest request) async {
    try {
      await remoteDataSource.forgetPassword(request);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> verifyCode(VerifyCodeRequest request) async {
    try {
      final response = await remoteDataSource.verifyCode(request);
      print("/////////////$response");
      return Right(response);
    } catch (e) {
      print("eeeeeee=> $e");
      return const Left(Failure('فشل التحقق من الكود'));
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(
      ResetPasswordRequest request) async {
    try {
      final response = await remoteDataSource.resetPassword(request);
      return Right(response);
    } catch (e) {
      return const Left(Failure("فشل في إعادة تعيين كلمة المرور"));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(
      ChangePasswordRequest request) async {
    try {
      final result = await remoteDataSource.changePassword(request, '');
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
