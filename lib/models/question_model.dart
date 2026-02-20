import 'package:quiz_app/models/answer_model.dart';

class QuestionModel {
  QuestionModel({
    required this.question,
    required this.id,
    required this.answers,
    required this.correctAnswerId,
  });

  final String question;
  final int id;
  final List<AnswerModel> answers;
  final int correctAnswerId;

  QuestionModel copyWith({
    String? question,
    int? id,
    List<AnswerModel>? answers,
    int? correctAnswerId,
  }) {
    return QuestionModel(
      question: question ?? this.question,
      id: id ?? this.id,
      answers: answers ?? this.answers,
      correctAnswerId: correctAnswerId ?? this.correctAnswerId,
    );
  }
}
