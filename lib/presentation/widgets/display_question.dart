import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayQuestion extends StatelessWidget {
  final String questionAsked;
  const DisplayQuestion({Key? key, required this.questionAsked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 300,
      width: 500,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      child: Center(
        child: Text(
          questionAsked,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(color: Colors.black),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
