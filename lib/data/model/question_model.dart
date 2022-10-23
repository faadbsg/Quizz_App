import 'package:app_quizz_game/domain/entity/question_entity.dart';

class QuestionModel {
  final String questionModel;
  final String goodAnswerModel;
  final List<String> otherAnswerListModel;

  QuestionModel({
    required this.questionModel,
    required this.goodAnswerModel,
    required this.otherAnswerListModel,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> jsonReceived) {
    return QuestionModel(
      questionModel: jsonReceived['question'] as String,
      goodAnswerModel: jsonReceived['correct_answer'] as String,
      otherAnswerListModel:
          List<String>.from(jsonReceived['incorrect_answers']),
    );
  }

  QuestionEntity toEntity() {
    return QuestionEntity(
      question: questionModel,
      goodAnswer: goodAnswerModel,
      otherAnswerList: otherAnswerListModel,
    );
  }
}
