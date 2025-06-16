import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/features/user/chatBot/data/model/chat_response.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/chat_entity.dart';
import 'package:graduation_project/features/user/chatBot/domain/repository/chat_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChatUseCase {
  final ChatRepository chatRepository;
  ChatUseCase(this.chatRepository);
  Future<Either<Failure, ChatEntity>> call(String message) =>
      chatRepository.sendMessage(message);
}
