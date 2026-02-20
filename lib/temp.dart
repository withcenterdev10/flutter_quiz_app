import 'package:quiz_app/models/answer_model.dart';
import 'package:quiz_app/models/question_model.dart';

final questions = [
  QuestionModel(
    id: 1,
    question: "What is the main function entry point of every Flutter app?",
    answers: [
      AnswerModel(id: 1, answer: "runApp()"),
      AnswerModel(id: 2, answer: "startApp()"),
      AnswerModel(id: 3, answer: "mainApp()"),
      AnswerModel(id: 4, answer: "initApp()"),
    ],
    correctAnswerId: 1,
  ),
  QuestionModel(
    id: 2,
    question:
        "Which widget should you use when the UI depends on mutable state?",
    answers: [
      AnswerModel(id: 5, answer: "StatelessWidget"),
      AnswerModel(id: 6, answer: "StatefulWidget"),
      AnswerModel(id: 7, answer: "Container"),
      AnswerModel(id: 8, answer: "Builder"),
    ],
    correctAnswerId: 6,
  ),
  QuestionModel(
    id: 3,
    question:
        "Which widget is best for adding empty space with a fixed height or width?",
    answers: [
      AnswerModel(id: 9, answer: "Padding"),
      AnswerModel(id: 10, answer: "SizedBox"),
      AnswerModel(id: 11, answer: "Expanded"),
      AnswerModel(id: 12, answer: "Align"),
    ],
    correctAnswerId: 10,
  ),
  QuestionModel(
    id: 4,
    question: "What method is used to trigger a rebuild in a StatefulWidget?",
    answers: [
      AnswerModel(id: 13, answer: "rebuild()"),
      AnswerModel(id: 14, answer: "refresh()"),
      AnswerModel(id: 15, answer: "setState()"),
      AnswerModel(id: 16, answer: "updateUI()"),
    ],
    correctAnswerId: 15,
  ),
  QuestionModel(
    id: 5,
    question:
        "Which widget is commonly used to display a scrollable list of items?",
    answers: [
      AnswerModel(id: 17, answer: "Column"),
      AnswerModel(id: 18, answer: "Stack"),
      AnswerModel(id: 19, answer: "ListView"),
      AnswerModel(id: 20, answer: "Row"),
    ],
    correctAnswerId: 19,
  ),
  QuestionModel(
    id: 6,
    question: "Which widget allows you to place widgets on top of each other?",
    answers: [
      AnswerModel(id: 21, answer: "Column"),
      AnswerModel(id: 22, answer: "Stack"),
      AnswerModel(id: 23, answer: "ListView"),
      AnswerModel(id: 24, answer: "Wrap"),
    ],
    correctAnswerId: 22,
  ),
  QuestionModel(
    id: 7,
    question:
        "Which widget is typically used to create the basic visual layout structure for a Material Design screen?",
    answers: [
      AnswerModel(id: 25, answer: "Container"),
      AnswerModel(id: 26, answer: "Scaffold"),
      AnswerModel(id: 27, answer: "SafeArea"),
      AnswerModel(id: 28, answer: "Theme"),
    ],
    correctAnswerId: 26,
  ),
  QuestionModel(
    id: 8,
    question: "What does the build() method return in a widget?",
    answers: [
      AnswerModel(id: 29, answer: "A Future"),
      AnswerModel(id: 30, answer: "A Widget"),
      AnswerModel(id: 31, answer: "A String"),
      AnswerModel(id: 32, answer: "A State object"),
    ],
    correctAnswerId: 30,
  ),
  QuestionModel(
    id: 9,
    question:
        "Which widget expands to fill the remaining available space in a Row or Column?",
    answers: [
      AnswerModel(id: 33, answer: "Flexible"),
      AnswerModel(id: 34, answer: "Expanded"),
      AnswerModel(id: 35, answer: "Spacer"),
      AnswerModel(id: 36, answer: "Padding"),
    ],
    correctAnswerId: 34,
  ),
  QuestionModel(
    id: 10,
    question: "Which command is used to run a Flutter app in debug mode?",
    answers: [
      AnswerModel(id: 37, answer: "flutter start"),
      AnswerModel(id: 38, answer: "flutter run"),
      AnswerModel(id: 39, answer: "flutter build"),
      AnswerModel(id: 40, answer: "flutter execute"),
    ],
    correctAnswerId: 38,
  ),
];
