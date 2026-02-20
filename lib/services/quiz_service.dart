import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/temp.dart';

class QuizService with ChangeNotifier {
  bool showResults = false;
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

  void resetQuiz() {
    currentQuizQuestion = null;
    notifyListeners();
  }

  void nextQuestion() {
    if (quizQuestions.isNotEmpty) {
      quizQuestions.shuffle();

      quizQuestions.map((question) {
        question.answers.shuffle();
        return question;
      });

      final updateCurrentQuizQuestion = [
        ...?currentQuizQuestion,
        quizQuestions.removeLast(),
      ];
      debugPrint(
        "updateCurrentQuizQuestion: ${updateCurrentQuizQuestion.length}", // should increase
      );
      debugPrint("quizQuestions: ${quizQuestions.length}"); // should reduce
      _setCurrentQuizQuestions(updateCurrentQuizQuestion);
    } else {
      showResults = true;
      notifyListeners();
    }
  }

  void selectAnswer(int questionId, int answerId) {
    final updatedQuizCurrentQuestions = currentQuizQuestions!.map((question) {
      if (question.id == questionId) {
        question.selectedAnswerId = answerId;
        return question;
      } else {
        return question;
      }
    }).toList();

    _setCurrentQuizQuestions(updatedQuizCurrentQuestions);
  }
}
