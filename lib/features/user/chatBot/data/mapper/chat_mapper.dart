import 'package:graduation_project/features/user/chatBot/data/model/chat_response.dart';
import 'package:graduation_project/features/user/chatBot/domain/entity/chat_entity.dart';

extension ChatMapper on ChatResponse {
  ChatEntity toEntity() => ChatEntity(reply: reply);
}
