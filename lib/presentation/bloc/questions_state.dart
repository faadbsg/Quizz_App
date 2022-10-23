part of 'questions_bloc.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();

  @override
  List<Object> get props => [];
}

class QuestionsInitialState extends QuestionsState {}

class QuestionLoadingState extends QuestionsState {}

class QuestionLoadedState extends QuestionsState {
  final List<QuestionEntity> questionList;

  const QuestionLoadedState({required this.questionList});
}

class QuestionErrorState extends QuestionsState {
  final String errorMessage;

  const QuestionErrorState({required this.errorMessage});
}
