import 'package:flutter/material.dart';
import 'package:quizapp/componants/summerybuilder.dart';
import 'package:quizapp/data/question_data.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen(
      {super.key, required this.selectedanswers, required this.changescreen});
  final selectedanswers;
  final Function() changescreen;

  List<Map<String, Object>> getsummerydata() {
    List<Map<String, Object>> summery = [];

    for (int i = 0; i < selectedanswers.length; i++) {
      summery.add({
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-selected': selectedanswers[i]
      });
    }
    return summery;
  }

  @override
  Widget build(BuildContext context) {
    int numquestions = questions.length;
    var summerydata = getsummerydata();
    var correctanswers = summerydata.where((data) {
      return data['user-selected'] == data['correct-answer'];
    }).length;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: RadialGradient(
                colors: [
                  Color.fromARGB(255, 58, 8, 104),
                  Color.fromARGB(255, 110, 27, 146),
                ],
                radius: 1.5,
                tileMode: TileMode.mirror,
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 167, 127, 253),
                    blurRadius: 20,
                    blurStyle: BlurStyle.solid,
                    spreadRadius: .2)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You answered $correctanswers out of $numquestions correctly!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 25, color: Color.fromARGB(255, 68, 255, 180)),
                  ),

                  // result summery
                  Summerybuilder(
                    summarydata: summerydata,
                  ),
                  //restart quiz
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: changescreen,
                        child: const Text('restart quiz')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
