import 'package:flutter/material.dart';

import 'package:quizapp/pages/quizquestions.dart';
import 'package:quizapp/pages/startquiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedanswers = [];
  var currentscreen = 'start-screen';
  // saving the answers
  void chooseanswer(String answer) {
    selectedanswers.add(answer);
  }

  void changescreen() {
    setState(() {
      currentscreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromARGB(255, 110, 27, 146),
              Color.fromARGB(255, 58, 8, 104),
            ], radius: 1.5, tileMode: TileMode.mirror),
          ),
          child: currentscreen == 'start-screen'
              ? Startquiz(changescreen: changescreen)
              : Quizquestions(
                  chooseanswer: chooseanswer,
                ),
        ),
      ),
    );
  }
}
