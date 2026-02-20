class AnswerModel {
  AnswerModel({required this.id, required this.answer});

  final int id;
  final String answer;

  AnswerModel copyWith({int? id, String? answer}) {
    return AnswerModel(id: id ?? this.id, answer: answer ?? this.answer);
  }
}
