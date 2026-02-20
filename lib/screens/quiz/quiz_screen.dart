import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/screens/questions/question_view_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_result_screen.dart';
import 'package:quiz_app/services/quiz_service.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static const routeName = '/quiz_screen';
  static Function(BuildContext context) go = (context) => context.go(routeName);
  static Function(BuildContext context) push = (context) =>
      context.push(routeName);

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuilding");
    final quisInProgress = context.select<QuizService, bool>(
      (p) => p.currentQuizQuestions != null,
    );
    final currentQuestions = context.select<QuizService, List<QuestionModel>?>(
      (p) => p.currentQuizQuestions,
    );
    final questionCount = currentQuestions != null
        ? currentQuestions.length
        : 0;
    final showResults = context.select<QuizService, bool>((p) => p.showResults);

    return Scaffold(
      body: Center(
        child: !quisInProgress
            ? Column(
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
              )
            : showResults
            ? QuizResultScreen()
            : QuestionViewScreen(
                questionCount: questionCount,
                questionId: currentQuestions!.last.id,
              ),
      ),
    );
  }
}
