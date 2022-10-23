import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String question;
  final String goodAnswer;
  final List<String> otherAnswerList;

  const QuestionEntity({
    required this.question,
    required this.goodAnswer,
    required this.otherAnswerList,
  });

  @override
  List<Object?> get props => [question, goodAnswer, otherAnswerList];
}
