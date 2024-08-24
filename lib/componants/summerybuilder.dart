import 'package:flutter/material.dart';

class Summerybuilder extends StatelessWidget {
  const Summerybuilder({
    super.key,
    required this.summarydata,
  });

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
                    // index number of question
                    Container(
                      decoration: BoxDecoration(
                        color: data['user-selected'] == data['correct-answer']
                            ? const Color.fromARGB(255, 127, 186, 144)
                            : const Color.fromARGB(253, 207, 113, 106),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(
                            ((data['question-index'] as int) + 1).toString()),
                      ),
                    ),
                    // question and answer
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 228, 242, 245)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              data['user-selected'] as String,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 130, 251, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              data['correct-answer'] as String,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 190, 255, 130)),
                            ),
                            const SizedBox(height: 5)
                          ],
                        ),
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
