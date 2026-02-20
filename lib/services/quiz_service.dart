import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/temp.dart';

class QuizService with ChangeNotifier {
  List<QuestionModel> quizQuestions = questions;
  List<QuestionModel>? currentQuizQuestion;

  List<QuestionModel> get getQuestions {
    return quizQuestions;
  }

  List<QuestionModel>? get currentQuizQuestions {
    return currentQuizQuestion;
  }

  void _setQuizQuestions(List<QuestionModel> newQuestion) {
    quizQuestions = newQuestion;
    notifyListeners();
  }

  void _setCurrentQuizQuestions(List<QuestionModel> newQuestion) {
    currentQuizQuestion = newQuestion;
    notifyListeners();
  }

  void nextQuestion() {
    quizQuestions.shuffle();
    final updateCurrentQuizQuestion = [
      ...?currentQuizQuestion,
      quizQuestions.removeLast(),
    ];
    debugPrint(
      "updateCurrentQuizQuestion: ${updateCurrentQuizQuestion.length}", // should increase
    );
    debugPrint("quizQuestions: ${quizQuestions.length}"); // should reduce
    _setCurrentQuizQuestions(updateCurrentQuizQuestion);
  }
}
