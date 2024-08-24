import 'package:flutter/material.dart';

class Summerybuilder extends StatelessWidget {
  const Summerybuilder({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: summarydata.map(
              (data) {
                return Row(
                  children: [
                    Text(((data['question-index'] as int) + 1).toString()),
                    Expanded(
                      child: Column(
                        children: [
                          Text(data['question'] as String),
                          const SizedBox(height: 10),
                          Text(data['user-selected'] as String),
                          const SizedBox(height: 10),
                          Text(data['correct-answer'] as String),
                          const SizedBox(height: 10)
                        ],
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
