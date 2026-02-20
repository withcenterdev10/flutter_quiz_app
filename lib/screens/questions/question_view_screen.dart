import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/temp.dart';

class QuestionViewScreen extends StatefulWidget {
  const QuestionViewScreen({super.key});

  static const routeName = '/question_view_screen';
  static Function(BuildContext context) go = (context) => context.go(routeName);
  static Function(BuildContext context) push = (context) =>
      context.push(routeName);

  @override
  State<StatefulWidget> createState() {
    return _QuestionViewScreen();
  }
}

class _QuestionViewScreen extends State<QuestionViewScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Questions")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ...questions.map((q) {
              return Padding(
                padding: EdgeInsetsGeometry.only(bottom: 15),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text("${q.question}"),
                      const SizedBox(height: 10),
                      ...q.answers.map(
                        (answer) => SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("${answer.answer}"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
