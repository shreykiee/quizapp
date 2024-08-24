import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/componants/answerbutton.dart';
import 'package:quizapp/data/question_data.dart';

class Quizquestions extends StatefulWidget {
  const Quizquestions({super.key, required this.chooseanswer});
  final void Function(String) chooseanswer;
  @override
  State<Quizquestions> createState() => _QuizquestionsState();
}

class _QuizquestionsState extends State<Quizquestions> {
  int currentquestionindex = 0;

  void answerquestion(answer) {
    widget.chooseanswer(answer);
    if (currentquestionindex < questions.length - 1) {
      setState(() {
        currentquestionindex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentquestion = questions[currentquestionindex];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                textAlign: TextAlign.left,
                currentquestion.text,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentquestion.shuffledanswers().map(
              (answer) {
                return Answerbutton(
                  answer: answer,
                  ontapanswer: () {
                    answerquestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
