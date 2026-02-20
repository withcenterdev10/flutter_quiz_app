import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/services/quiz_service.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  static const routeName = '/result_screen';
  static Function(BuildContext context) go = (context) => context.go(routeName);
  static Function(BuildContext context) push = (context) =>
      context.push(routeName);

  @override
  Widget build(BuildContext context) {
    final currentQuestions = context.select<QuizService, List<QuestionModel>?>(
      (p) => p.currentQuizQuestions,
    );
    final totalCorrectAnswers = context.select<QuizService, int>(
      (p) => p.currentQuizQuestions!
          .where(
            (question) => question.correctAnswerId == question.selectedAnswerId,
          )
          .length,
    );

    return Scaffold(
      appBar: AppBar(title: Text("Results")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "You got $totalCorrectAnswers / 10",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: .center,
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                context.read<QuizService>().resetQuiz();
              },
              icon: Icon(Icons.replay),
              label: Text("Replay"),
            ),
            const SizedBox(height: 30),
            Text("Questions:", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 30),
            ...currentQuestions!.asMap().entries.map((entry) {
              final index = entry.key + 1;
              final q = entry.value;
              return Padding(
                padding: EdgeInsetsGeometry.only(bottom: 30),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .min,
                    children: [
                      Text("$index.) ${q.question}"),
                      const SizedBox(height: 10),
                      ...q.answers.map(
                        (answer) => SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style:
                                q.selectedAnswerId == answer.id &&
                                    q.selectedAnswerId == q.correctAnswerId
                                ? ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  )
                                : q.selectedAnswerId == answer.id &&
                                      q.selectedAnswerId != q.correctAnswerId
                                ? ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                  )
                                : q.selectedAnswerId != q.correctAnswerId &&
                                      answer.id == q.correctAnswerId
                                ? ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  )
                                : null,
                            onPressed: () {},
                            child: Text(answer.answer),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
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
