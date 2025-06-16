import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/user/chatBot/domain/use_case/analysis_use_case.dart';
import 'package:graduation_project/features/user/chatBot/presentation/cubit/chat_states.dart';
import 'package:injectable/injectable.dart';

@singleton
class AnalysisCubit extends Cubit<ChatStates> {
  final AnalysisUseCase useCase;
  AnalysisCubit(this.useCase) : super(ChatInitial());
  Future<void> analysisImage(String filePath) async {
    emit(ChatLoading());
    final result = await useCase.call(filePath);
    result.fold((failure) => emit(ChatError(failure.message)),
        (image) => emit(AnalysisSuccess(image)));
  }
}
