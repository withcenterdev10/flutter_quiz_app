import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/questions/question_create_screen.dart';

final router = GoRouter(
  initialLocation: QuestionCreateScreen.routeName,
  routes: [
    GoRoute(
      path: QuestionCreateScreen.routeName,
      builder: (BuildContext context, state) => QuestionCreateScreen(),
    ),
  ],
);
