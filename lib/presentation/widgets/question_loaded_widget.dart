// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_quizz_game/presentation/pages/results_page.dart';
import 'package:app_quizz_game/presentation/widgets/delay_animation_widget.dart';
import 'package:app_quizz_game/presentation/widgets/display_answers.dart';
import 'package:app_quizz_game/presentation/widgets/display_question.dart';
import 'package:app_quizz_game/presentation/widgets/rotation_animation_widget.dart';
import 'package:flutter/material.dart';

import 'package:app_quizz_game/domain/entity/question_entity.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionLoadedWidget extends StatefulWidget {
  final List<QuestionEntity> questions;

  const QuestionLoadedWidget({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  State<QuestionLoadedWidget> createState() => _QuestionLoadedWidgetState();
}

class _QuestionLoadedWidgetState extends State<QuestionLoadedWidget> {
  GlobalKey<DisplayAnswersState> displayKey = GlobalKey();
  int index = 0;
  Color colorButton = Colors.white;
  int answersGood = 0;
  @override
  Widget build(BuildContext context) {
    List<String> answersList = widget.questions[index].otherAnswerList;
    answersList.add(widget.questions[index].goodAnswer);
    answersList.shuffle();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationAnimationWidget(
            child: DisplayQuestion(
                questionAsked: widget.questions[index].question),
          ),
          const SizedBox(height: 10),
          DelayAnimationWidget(
            delay: 1500,
            child: DisplayAnswers(
              key: displayKey,
              answerListDisplayed: answersList,
              goodAnswerDisplayed: widget.questions[index].goodAnswer,
              colorButton: Colors.white,
            ),
          ),
          DelayAnimationWidget(
            delay: 1500,
            child: Container(
              margin: const EdgeInsets.all(5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: const StadiumBorder(),
                    fixedSize: const Size(400, 70)),
                child: Text(
                  'Next Question',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(color: Colors.white),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: nextQuestionOrGetResult,
              ),
            ),
          )
        ],
      ),
    );
  }

  void nextQuestionOrGetResult() {
    if (index < widget.questions.length - 1) {
      displayKey.currentState!.init();
      setState(() {
        index++;
      });
    } else {
      index = 0;
      answersGood = displayKey.currentState!.getGoodAnswers;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ResultsPage(numberGoodAnswer: answersGood)));
    }
  }
}
