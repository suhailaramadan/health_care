import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/feedback/domain/entites/feedback_entity.dart';
import 'package:graduation_project/features/feedback/domain/use_case/feedback_use_case.dart';
import 'package:graduation_project/features/feedback/presentation/cubit/feedbach_status.dart';
import 'package:injectable/injectable.dart';

@singleton
class FeedbackCubit extends Cubit<FeedbackStates> {
  final SendFeedbackUseCase sendFeedbackUseCase;
  FeedbackCubit(this.sendFeedbackUseCase) : super(FeedbackInitial());
  Future<void> sendFeedback(FeedbackEntity feedback) async {
    emit(FeedbackLoading());
    final result = await sendFeedbackUseCase(feedback);
    result.fold((failure) => emit(FeedbackError(failure.message)),
        (message) => emit(FeedbackSuccess(message)));
  }
}
