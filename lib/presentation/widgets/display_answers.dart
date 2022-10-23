import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayAnswers extends StatefulWidget {
  final List<String> answerListDisplayed;
  final String goodAnswerDisplayed;
  final Color colorButton;
  const DisplayAnswers({
    Key? key,
    required this.answerListDisplayed,
    required this.goodAnswerDisplayed,
    required this.colorButton,
  }) : super(key: key);

  @override
  State<DisplayAnswers> createState() => DisplayAnswersState();
}

class DisplayAnswersState extends State<DisplayAnswers> {
  late int goodAnswers;
  List<Color> colorList = List.filled(4, Colors.white, growable: true);
  @override
  void initState() {
    super.initState();
    goodAnswers = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            buildAnswerButton(
              0,
              widget.answerListDisplayed.elementAt(0),
              widget.goodAnswerDisplayed,
            ),
            const SizedBox(
              width: 2,
            ),
            buildAnswerButton(
              1,
              widget.answerListDisplayed.elementAt(1),
              widget.goodAnswerDisplayed,
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          children: <Widget>[
            buildAnswerButton(
              2,
              widget.answerListDisplayed.elementAt(2),
              widget.goodAnswerDisplayed,
            ),
            const SizedBox(
              width: 2,
            ),
            buildAnswerButton(
              3,
              widget.answerListDisplayed.elementAt(3),
              widget.goodAnswerDisplayed,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAnswerButton(
      int valIndex, String randomAnswer, String goodAnswer) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(9),
        child: ElevatedButton(
          child: Text(
            randomAnswer,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(color: Colors.black),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: colorList[valIndex],
            fixedSize: const Size(200, 90),
            shadowColor: Colors.black,
            elevation: 4.0,
          ),
          onPressed: () {
            setState(() {
              if (randomAnswer == goodAnswer) {
                colorList.replaceRange(valIndex, valIndex, [Colors.green]);
                goodAnswers++;
                // varColor = Colors.green;
              } else {
                colorList.replaceRange(valIndex, valIndex, [Colors.red]);
                // varColor = Colors.red;
              }
            });
          },
        ),
      ),
    );
  }

  void initColorButtons() {
    colorList = List.filled(4, Colors.white);
    setState(() {});
  }

  void init() {
    colorList = List.filled(4, Colors.white, growable: true);
    setState(() {});
  }

  int get getGoodAnswers => goodAnswers;
}
