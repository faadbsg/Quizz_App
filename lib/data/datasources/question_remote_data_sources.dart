import 'dart:convert';

import 'package:app_quizz_game/common/error/exception.dart';
import 'package:app_quizz_game/data/model/question_model.dart';
import 'package:http/http.dart' as http;

abstract class QuestionRemoteDataSources {
  Future<List<QuestionModel>> getQuestions();
}

class QuestionRemoteDataSourcesImpl implements QuestionRemoteDataSources {
  final http.Client client;

  QuestionRemoteDataSourcesImpl({required this.client});

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final response = await client.get(
      Uri.parse(
          'https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final responseMap = jsonMap['results'] as List<dynamic>;
      final questionModel = responseMap.map((e) {
        return QuestionModel.fromJson(Map<String, dynamic>.from(e));
      }).toList();
      return questionModel;
    } else {
      throw ServerException();
    }
  }
}
