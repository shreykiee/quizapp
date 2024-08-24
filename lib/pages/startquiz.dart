import 'package:flutter/material.dart';

class Startquiz extends StatelessWidget {
  const Startquiz({
    super.key,
    required this.changescreen,
  });

  final void Function() changescreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              "assets/images/quiz-logo.png",
              color: const Color.fromARGB(142, 255, 255, 255),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
              style: const ButtonStyle(),
              onPressed: changescreen,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Start Quiz"),
                  SizedBox(width: 20),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
