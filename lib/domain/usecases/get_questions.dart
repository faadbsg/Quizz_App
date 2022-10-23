import 'package:app_quizz_game/common/error/failure.dart';
import 'package:app_quizz_game/common/usecase/usecase.dart';
import 'package:app_quizz_game/domain/entity/question_entity.dart';
import 'package:app_quizz_game/domain/repository/question_repository.dart';
import 'package:dartz/dartz.dart';

class GetQuestions extends UseCase<List<QuestionEntity>, void> {
  final QuestionRepository repository;

  GetQuestions({required this.repository});

  @override
  Future<Either<Failure, List<QuestionEntity>>> call() async {
    return await repository.getQuestions();
  }
}
