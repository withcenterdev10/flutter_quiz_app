import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/questions/question_view_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_result_screen.dart';

final router = GoRouter(
  initialLocation: QuizScreen.routeName,
  routes: [
    GoRoute(
      path: QuestionViewScreen.routeName,
      builder: (BuildContext context, state) => QuestionViewScreen(),
    ),
    GoRoute(
      path: QuizScreen.routeName,
      builder: (BuildContext context, state) => QuizScreen(),
    ),
    GoRoute(
      path: QuizResultScreen.routeName,
      builder: (BuildContext context, state) => QuizResultScreen(),
    ),
  ],
);
