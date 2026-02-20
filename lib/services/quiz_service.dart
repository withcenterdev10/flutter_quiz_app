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
    questions.shuffle();
    final updatedQuestions = questions.map((question) {
      final answers = question.answers;
      answers.shuffle();
      question.answers = answers;
      return question;
    }).toList();

    quizQuestions = updatedQuestions;
    currentQuizQuestion = null;
    notifyListeners();
  }

  void showResult() {
    notifyListeners();
  }

  void nextQuestion() {
    if (quizQuestions.isNotEmpty) {
      final nextQuestion = quizQuestions.removeLast();
      nextQuestion.selectedAnswerId = null;
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
