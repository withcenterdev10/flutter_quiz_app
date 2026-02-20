import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/services/quiz_service.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static const routeName = '/quiz_screen';
  static Function(BuildContext context) go = (context) => context.go(routeName);
  static Function(BuildContext context) push = (context) =>
      context.push(routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              "Lets review Flutter!",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                context.read<QuizService>().nextQuestion();
              },
              child: Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}
