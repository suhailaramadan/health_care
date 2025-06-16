import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chate_remote_data_source.dart';
import 'package:graduation_project/features/user/chatBot/data/mapper/analysis_mapper.dart';
import 'package:graduation_project/features/user/chatBot/data/mapper/chat_mapper.dart';
import 'package:graduation_project/features/user/chatBot/data/model/analysis_response.dart';
import 'package:graduation_project/features/user/chatBot/data/model/chat_response.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/analysis_entity.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/chat_entity.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ChatRemoteDataSource)
class ChatApiRemoteDataSource extends ChatRemoteDataSource {
  final Dio dio;
  ChatApiRemoteDataSource(this.dio);
  @override
  Future<Either<Failure, ChatEntity>> sendMessage(String message) async {
    try {
      final response = await dio
          .post("http://51.21.124.246/chat", data: {"message": message});
      if (response.statusCode == 200) {
        final model = ChatResponse.fromJson(response.data);
        return Right(model.toEntity());
      } else {
        throw RemoteException(response.toString());
      }
    } catch (e) {
      throw const RemoteException("حدث خطأ غير متوقع");
    }
  }

  @override
  Future<Either<Failure, AnalysisEntity>> analysisImage(String filePath) async {
    try {
      final formData = FormData.fromMap(
        {'image': await MultipartFile.fromFile(filePath, filename: '')},
      );
      final response =
          await dio.post("http://51.21.124.246/analyze", data: formData);
      if (response.statusCode == 200) {
        final model = AnalysisResponse.fromJson(response.data);
        return Right(model.toEntity());
      } else {
        throw RemoteException(response.toString());
      }
    } catch (e) {
      throw const RemoteException("حدث خطأ غير متوقع");
    }
  }
}
