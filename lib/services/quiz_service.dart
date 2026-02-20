import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/temp.dart';

class QuizService with ChangeNotifier {
  List<QuestionModel> quizQuestions = [...questions];
  List<QuestionModel>? currentQuizQuestion;
  QuestionModel? currentQuestion;

  QuestionModel? get getCurrentQuestion {
    return currentQuestion;
  }

  List<QuestionModel>? get currentQuizQuestions {
    return currentQuizQuestion;
  }

  void resetQuiz() {
    quizQuestions = questions;
    currentQuizQuestion = null;
    notifyListeners();
  }

  void showResult() {
    notifyListeners();
  }

  void nextQuestion() {
    if (quizQuestions.isNotEmpty) {
      quizQuestions.shuffle();

      final nextQuestion = quizQuestions.removeLast();
      nextQuestion.selectedAnswerId = null;
      final answers = nextQuestion.answers;
      answers.shuffle();
      nextQuestion.answers = answers;

      final updateCurrentQuizQuestion = [...?currentQuizQuestion, nextQuestion];
      currentQuestion = nextQuestion;
      currentQuizQuestion = updateCurrentQuizQuestion;
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

    currentQuizQuestion = updatedQuizCurrentQuestions;
    notifyListeners();
  }
}
