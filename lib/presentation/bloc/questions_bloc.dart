import 'package:app_quizz_game/common/error/failure.dart';
import 'package:app_quizz_game/domain/entity/question_entity.dart';
import 'package:app_quizz_game/domain/usecases/get_questions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'questions_event.dart';
part 'questions_state.dart';

const String serverFailureMessage = 'Server Failure';
const String cacheFailureMessage = 'Cache Failure';
const String connectionFailureMessage = 'ConnectionFailure';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  final GetQuestions questions;

  QuestionsBloc({required this.questions}) : super(QuestionsInitialState()) {
    on<QuestionsEvent>((event, emit) async {
      if (event is GetQuestionsEvent) {
        emit(QuestionLoadingState());
        final valQuestion = await questions.call();
        emit(valQuestion.fold(
          (failure) =>
              QuestionErrorState(errorMessage: _failureMessagDisplay(failure)),
          (question) => QuestionLoadedState(questionList: question),
        ));
      }
    });
  }

  String _failureMessagDisplay(Failure failure) {
    if (failure is ServerFailure) {
      return serverFailureMessage;
    } else if (failure is ConnectionFailure) {
      return connectionFailureMessage;
    } else if (failure is CacheFailure) {
      return cacheFailureMessage;
    } else {
      return 'Failure Unknown';
    }
  }
}
