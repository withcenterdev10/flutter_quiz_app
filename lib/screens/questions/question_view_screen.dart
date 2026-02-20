import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/quiz/quiz_result_screen.dart';
import 'package:quiz_app/services/quiz_service.dart';

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
    final question = context.select<QuizService, QuestionModel?>(
      (service) => service.currentQuestion,
    );
    final questionCount = context.select<QuizService, int>(
      (service) => service.currentQuizQuestions == null
          ? 1
          : service.currentQuizQuestions!.length,
    );
    final userSelectedAnAnswer = context.select<QuizService, bool>(
      (service) =>
          service.currentQuestion != null &&
          service.currentQuestion!.selectedAnswerId != null,
    );

    if (question == null) return const SizedBox();

    debugPrint("userSelectedAnAnswer: $userSelectedAnAnswer");

    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: AlignmentGeometry.topCenter,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                const SizedBox(height: 20),
                Text("$questionCount.) ${question.question}"),
                const SizedBox(height: 20),
                ...question.answers.map(
                  (answer) => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<QuizService>().selectAnswer(
                          question.id,
                          answer.id,
                        );
                      },
                      child: Text(answer.answer),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                if (userSelectedAnAnswer)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        if (questionCount == 10) {
                          QuizResultScreen.go(context);
                        } else {
                          context.read<QuizService>().nextQuestion();
                        }
                      },
                      child: Text("Next"),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
