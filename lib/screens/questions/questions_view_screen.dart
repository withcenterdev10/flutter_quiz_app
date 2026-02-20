import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/temp.dart';

class QuestionsViewScreen extends StatefulWidget {
  const QuestionsViewScreen({super.key});

  static const routeName = '/questions_view_screen';
  static Function(BuildContext context) go = (context) => context.go(routeName);
  static Function(BuildContext context) push = (context) =>
      context.push(routeName);

  @override
  State<StatefulWidget> createState() {
    return _QuestionsViewScreen();
  }
}

class _QuestionsViewScreen extends State<QuestionsViewScreen> {
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
                      Text(q.question),
                      const SizedBox(height: 10),
                      ...q.answers.map(
                        (answer) => SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(answer.answer),
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
