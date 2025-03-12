import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:graduation_project/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:graduation_project/features/auth/data/models/login/login_request.dart';
import 'package:graduation_project/features/auth/data/models/login/login_response.dart';
import 'package:graduation_project/features/auth/data/models/register/register_request.dart';
import 'package:graduation_project/features/auth/data/models/register/register_response.dart';
import 'package:graduation_project/features/auth/domain/entity/user_entity.dart';
import 'package:graduation_project/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  Future<Either<Failure, UserEntity>> register(RegisterRequest request) async {
    try {
      final response = await remoteDataSource.register(request);
      return right(response);
    } on AppException catch (exception) {
      return left(Failure(exception.message));
    }
  }

  Future<Either<Failure, UserEntity>> login(LoginRequest request) async {
    try {
      final response = await remoteDataSource.login(request);
      await localDataSource.saveToken(response.token!);
      return Right(response);
    } on AppException catch (exception) {
      return left(Failure(exception.message));
    }
  }
}
