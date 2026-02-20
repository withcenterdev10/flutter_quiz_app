import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/temp.dart';

class QuizService with ChangeNotifier {
  bool showResults = false;
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
    showResults = false;
    notifyListeners();
  }

  void nextQuestion() {
    if (quizQuestions.isNotEmpty) {
      quizQuestions.shuffle();

      final nextQuestion = quizQuestions.last;
      final answers = nextQuestion.answers;
      answers.shuffle();
      nextQuestion.answers = answers;

      final updateCurrentQuizQuestion = [...?currentQuizQuestion, nextQuestion];
      currentQuestion = nextQuestion;
      currentQuizQuestion = updateCurrentQuizQuestion;
      notifyListeners();
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

    currentQuizQuestion = updatedQuizCurrentQuestions;
    notifyListeners();
  }
}
