import 'package:flutter/material.dart';

class Answerbutton extends StatelessWidget {
  const Answerbutton(
      {super.key, required this.answer, required this.ontapanswer});
  final String answer;
  final void Function() ontapanswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: ontapanswer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
