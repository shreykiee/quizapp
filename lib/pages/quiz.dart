import 'package:flutter/material.dart';
import 'package:quizapp/data/question_data.dart';
import 'package:quizapp/pages/answer-screen.dart';
import 'package:quizapp/pages/quizquestions.dart';
import 'package:quizapp/pages/startquiz.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedanswers = [];
  late Widget currentscreen = Startquiz(changescreen: changescreen);

  // saving the answers
  void chooseanswer(String answer) {
    selectedanswers.add(answer);
    if (selectedanswers.length == questions.length) {
      setState(() {
        currentscreen = AnswerScreen(
          selectedanswers: selectedanswers,
          changescreen: changescreen,
        );
      });
    }
  }

  void changescreen() {
    setState(() {
      currentscreen = Quizquestions(chooseanswer: chooseanswer);
      selectedanswers.clear();
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
            child: currentscreen),
      ),
    );
  }
}
