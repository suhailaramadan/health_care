import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/clinic/data/data_sources/remote/clinic_remote_data_source.dart';
import 'package:graduation_project/features/clinic/data/mappers/clinic_mappers.dart';
import 'package:graduation_project/features/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/clinic/domain/repository/clinic_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@LazySingleton(as: ClinicRepository)
class ClinicRepositoryImpl implements ClinicRepository {
  final ClinicRemoteDataSource _remoteDataSource;
  const ClinicRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<ClinicEntity>>> getClinic() async {
    try {
      final response = await _remoteDataSource.getClinics();
      return Right(
          response.data!.map((clinicModel) => clinicModel.toEntity).toList());
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
