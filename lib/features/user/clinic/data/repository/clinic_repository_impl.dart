import 'package:dio/dio.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/clinic/data/data_sources/remote/clinic_remote_data_source.dart';
import 'package:graduation_project/features/user/clinic/data/mappers/clinic_mappers.dart';
import 'package:graduation_project/features/user/clinic/data/mappers/search_mapper.dart';
import 'package:graduation_project/features/user/clinic/domain/entities/clinic_entity.dart';
import 'package:graduation_project/features/user/clinic/domain/repository/clinic_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@LazySingleton(as: ClinicRepository)
class ClinicRepositoryImpl implements ClinicRepository {
  final ClinicRemoteDataSource _remoteDataSource;
  const ClinicRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<ClinicEntity>>> getClinics() async {
    try {
      final response = await _remoteDataSource.getClinics();
      return Right(
          response.data!.map((clinicModel) => clinicModel.toEntity).toList());
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<ClinicEntity>>> getClinicsById(int id) async {
    try {
      final response = await _remoteDataSource.getClinicsByID(id);
      return Right(
          response.data!.map((clinicModel) => clinicModel.toEntity).toList());
    } on RemoteException catch (exception) {
      return left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<ClinicEntity>>> search(String query) async {
    try {
      final response = await _remoteDataSource.search(query);
      print(response.data);
      if (response.data == null || response.data!.isEmpty) {
        return const Left(Failure('لا توجد نتائج مطابقة'));
      }
      return Right(response.data!.map((searchModel) {
        searchModel.imageUrl = getFullImageUrl(searchModel.imageUrl ?? '');
        return searchModel.toEntity;
      }).toList());
    } on RemoteException catch (exception) {
      return left(Failure(exception.message));
    }
  }

  String getFullImageUrl(String imageUrl) {
    if (!imageUrl.startsWith("https")) {
      return 'https://myclinicapp.runasp.net$imageUrl';
    }
    return imageUrl;
  }
}
