import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chat_api_remote_data_source.dart';
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chate_remote_data_source.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/analysis_entity.dart';
import 'package:graduation_project/features/user/chatBot/domain/repository/analysis_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AnalysisRepository)
class AnalysisRepositoryImpl extends AnalysisRepository {
  final ChatRemoteDataSource chatRemoteDataSource;
  AnalysisRepositoryImpl(this.chatRemoteDataSource);
  @override
  Future<Either<Failure, AnalysisEntity>> analysisImage(String filePath) async {
    try {
      final response = await chatRemoteDataSource.analysisImage(filePath);
      return response;
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
}
