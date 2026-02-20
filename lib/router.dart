import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/questions/question_create_screen.dart';
import 'package:quiz_app/screens/questions/question_view_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

final router = GoRouter(
  initialLocation: QuizScreen.routeName,
  routes: [
    GoRoute(
      path: QuestionCreateScreen.routeName,
      builder: (BuildContext context, state) => QuestionCreateScreen(),
    ),
    GoRoute(
      path: QuestionViewScreen.routeName,
      builder: (BuildContext context, state) => QuestionViewScreen(),
    ),
    GoRoute(
      path: QuizScreen.routeName,
      builder: (BuildContext context, state) => QuizScreen(),
    ),
  ],
);
