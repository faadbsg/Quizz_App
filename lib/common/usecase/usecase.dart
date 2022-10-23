import 'package:app_quizz_game/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Void> {
  Future<Either<Failure, Type>> call();
}
