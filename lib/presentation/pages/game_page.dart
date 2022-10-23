import 'package:app_quizz_game/injection_container.dart';
import 'package:app_quizz_game/presentation/bloc/questions_bloc.dart';
import 'package:app_quizz_game/presentation/pages/welcome_page.dart';
import 'package:app_quizz_game/presentation/widgets/loading_widget.dart';
import 'package:app_quizz_game/presentation/widgets/question_error_widget.dart';
import 'package:app_quizz_game/presentation/widgets/question_loaded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Game',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(color: Colors.white),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.blue,
              ]),
        ),
        child: buildPage(context),
      ),
    );
  }

  BlocProvider<QuestionsBloc> buildPage(BuildContext context) {
    return BlocProvider<QuestionsBloc>(
      create: (_) => sl<QuestionsBloc>(),
      child: Center(child:
          BlocBuilder<QuestionsBloc, QuestionsState>(builder: (context, state) {
        if (state is QuestionsInitialState) {
          return const WelcomePage();
        } else if (state is QuestionLoadingState) {
          return const LoadingWidget();
        } else if (state is QuestionLoadedState) {
          return QuestionLoadedWidget(questions: state.questionList);
        } else if (state is QuestionErrorState) {
          return QuestionErrorWidget(msgError: state.errorMessage);
        }
        throw '';
      })),
    );
    // );
  }
}
