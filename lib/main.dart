import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/router.dart';
import 'package:quiz_app/services/quiz_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizService(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
