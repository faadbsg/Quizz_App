import 'package:app_quizz_game/presentation/bloc/questions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      //width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.blue,
              Colors.white,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              child: Image.asset(
                  'assets/images/image_quizz_bois.png'), // Changer d'image car fond non transparent
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(
              'Welcome to the Quiz Game',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.white),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            child: ElevatedButton(
              child: Text(
                'Start',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(color: Colors.white),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: const StadiumBorder(),
                fixedSize: const Size(300, 80),
              ),
              onPressed: () {
                launchQuizz(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void launchQuizz(BuildContext context) {
    BlocProvider.of<QuestionsBloc>(context).add(GetQuestionsEvent());
  }
}
