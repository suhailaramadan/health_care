import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/feedback/data/data_source/remote/feedback_remote_data_source.dart';
import 'package:graduation_project/features/feedback/data/model/feedback_get_response/feedback_get_response.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';
import 'package:graduation_project/features/feedback/domain/repository/feedback_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FeedbackRepository)
class FeedbackRepositoryImpl extends FeedbackRepository {
  final FeedbackRemoteDataSource remoteDataSource;
  FeedbackRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, FeedbackGetResponse>> sendFeedback(
      FeedbackEntity entity) async {
    try {
      final result = await remoteDataSource.sendFeedBack(entity);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
