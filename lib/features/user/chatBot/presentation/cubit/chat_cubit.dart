import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/chatBot/domain/use_case/chat_use_case.dart';
import 'package:graduation_project/features/user/chatBot/presentation/cubit/chat_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class ChatCubit extends Cubit<ChatStates> {
  final ChatUseCase chatUseCase;
  ChatCubit(this.chatUseCase) : super(ChatInitial());
  Future<void> sendMessage(String message) async {
    emit(ChatLoading());
    final result = await chatUseCase.call(message);
    result.fold((failure) => emit(ChatError(failure.message)),
        (chatEntity) => emit(ChatSuccess(chatEntity.reply ?? '')));
  }
}
