import 'package:app_quizz_game/common/network/network_info.dart';
import 'package:app_quizz_game/data/datasources/question_remote_data_sources.dart';
import 'package:app_quizz_game/data/repository/question_repository_impl.dart';
import 'package:app_quizz_game/domain/repository/question_repository.dart';
import 'package:app_quizz_game/domain/usecases/get_questions.dart';
import 'package:app_quizz_game/presentation/bloc/questions_bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory(() => QuestionsBloc(questions: sl()));

  //! Feature (Repository - Use cases - datasources)

  //Usecase
  sl.registerLazySingleton(() => GetQuestions(repository: sl()));

  //Repository
  sl.registerLazySingleton<QuestionRepository>(
    () => QuestionRepositoryImpl(networkInfo: sl(), remoteQuestion: sl()),
  );

  //Datasources
  sl.registerLazySingleton<QuestionRemoteDataSources>(
      () => QuestionRemoteDataSourcesImpl(client: sl()));

  //Network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(checker: sl()));

  //!External
  //Client
  sl.registerLazySingleton<http.Client>(() => http.Client());
  //Datachecker
  sl.registerLazySingleton(() => DataConnectionChecker());
}
