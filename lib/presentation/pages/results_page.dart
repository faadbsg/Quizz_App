import 'package:app_quizz_game/presentation/pages/welcome_page.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsPage extends StatefulWidget {
  final int numberGoodAnswer;
  const ResultsPage({
    Key? key,
    required this.numberGoodAnswer,
  }) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 20));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.blue,
              ]),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${widget.numberGoodAnswer}/10',
              style: GoogleFonts.lato(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            buildCommentaireResult(widget.numberGoodAnswer),
            Container(
              margin: const EdgeInsets.all(30),
              child: ElevatedButton(
                child: Text(
                  'Restart',
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WelcomePage()));
                },
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget buildCommentaireResult(int numberGoodAnswerParam) {
    if (numberGoodAnswerParam > 5) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Congradulation !',
                style: GoogleFonts.lato(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'You are a good player !',
                style: GoogleFonts.lato(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ConfettiWidget(
            confettiController: _confettiController,
            shouldLoop: true,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 20,
            emissionFrequency: 0.04,
            minBlastForce: 10,
            maxBlastForce: 20,
            colors: const [
              Colors.red,
              Colors.yellow,
              Colors.blue,
              Colors.pink,
              Colors.green
            ],
            gravity: 1.0,
          ),
        ],
      );
    } else if (numberGoodAnswerParam < 5) {
      return Column(
        children: <Widget>[
          Text(
            'Too Bad !',
            style: GoogleFonts.lato(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'You can have an other chance!',
            style: GoogleFonts.lato(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text(
            'It is medium !',
            style: GoogleFonts.lato(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'You can do better !',
            style: GoogleFonts.lato(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Try again',
            style: GoogleFonts.lato(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }
  }
}
