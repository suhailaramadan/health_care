import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/error/exceptions.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/chatBot/data/data_source/remote/chate_remote_data_source.dart';
import 'package:graduation_project/features/user/chatBot/data/model/chat_response.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/chat_entity.dart';
import 'package:graduation_project/features/user/chatBot/domain/repository/chat_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ChatRepository)
class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;
  ChatRepositoryImpl(this.chatRemoteDataSource);
  @override
  Future<Either<Failure, ChatEntity>> sendMessage(String message) async {
    try {
      final response = await chatRemoteDataSource.sendMessage(message);
      return response;
    } catch (e) {
      throw RemoteException(e.toString());
    }
  }
  // @override
  // Future<Either<Failure, ChatEntity>> sendMessage(String message) async {
  //   try {
  //     final response = await chatRemoteDataSource.sendMessage(message);
  //     return Right(response );
  //   } catch (e) {}
  // }
}
