import 'package:flutter/material.dart';
import 'package:quizapp/componants/summerybuilder.dart';
import 'package:quizapp/data/question_data.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key, required this.selectedanswers});
  final selectedanswers;

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
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'You answered $correctanswers out of $numquestions correctly!'),
              // result summery
              Summerybuilder(
                summarydata: summerydata,
              ),
              //restart quiz
              ElevatedButton(onPressed: () {}, child: Text('restart quiz'))
            ],
          ),
        ),
      ),
    );
  }
}
