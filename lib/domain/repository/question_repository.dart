import 'package:app_quizz_game/common/error/failure.dart';
import 'package:app_quizz_game/domain/entity/question_entity.dart';
import 'package:dartz/dartz.dart';

abstract class QuestionRepository {
  Future<Either<Failure, List<QuestionEntity>>> getQuestions();
}
