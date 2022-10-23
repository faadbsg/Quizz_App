import 'package:app_quizz_game/common/error/exception.dart';
import 'package:app_quizz_game/common/network/network_info.dart';
import 'package:app_quizz_game/data/datasources/question_remote_data_sources.dart';
import 'package:app_quizz_game/domain/entity/question_entity.dart';
import 'package:app_quizz_game/common/error/failure.dart';
import 'package:app_quizz_game/domain/repository/question_repository.dart';
import 'package:dartz/dartz.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final NetworkInfo networkInfo;
  final QuestionRemoteDataSources remoteQuestion;

  QuestionRepositoryImpl({
    required this.networkInfo,
    required this.remoteQuestion,
  });

  @override
  Future<Either<Failure, List<QuestionEntity>>> getQuestions() async {
    if (await networkInfo.isConnected) {
      try {
        final questionModels = await remoteQuestion.getQuestions();
        final questionEntity = questionModels.map((e) => e.toEntity()).toList();
        return Right(questionEntity);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
