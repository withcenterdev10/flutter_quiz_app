import 'package:flutter/material.dart';
// import 'package:flutter_profile/services/auth/auth_service.dart';
// import 'package:flutter_profile/screens/auth/sign_up_screen.dart';
// import 'package:flutter_profile/screens/home/home_screen.dart';
// import 'package:flutter_profile/widgets/unfocus_close_keyboard.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
import 'package:quiz_app/widgets/unfocus_close_keyboard.dart';

class QuestionCreateScreen extends StatefulWidget {
  const QuestionCreateScreen({super.key});

  // static const routeName = '/sign_in';
  // static Function(BuildContext context) go = (context) => context.go(routeName);
  // static Function(BuildContext context) push = (context) =>
  //     context.push(routeName);

  @override
  State<StatefulWidget> createState() {
    return _QuestionCreateScreen();
  }
}

class _QuestionCreateScreen extends State<QuestionCreateScreen> {
  final questionController = TextEditingController();
  final answer1Controller = TextEditingController();
  final answer2Controller = TextEditingController();
  final answer3Controller = TextEditingController();
  final answer4Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    questionController.dispose();
    answer1Controller.dispose();
    answer2Controller.dispose();
    answer3Controller.dispose();
    answer4Controller.dispose();

    super.dispose();
  }

  void onSubmit(BuildContext context) async {
    late String message;
    if (formKey.currentState!.validate()) {
      final question = questionController.text;
      final answer1 = answer1Controller.text;
      final answer2 = answer2Controller.text;
      final answer3 = answer3Controller.text;
      final answer4 = answer4Controller.text;

      try {
        debugPrint(question);
      } catch (error) {
        message = "Sign up failed";
        debugPrint(error.toString());
      } finally {
        formKey.currentState!.reset();
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusCloseKeyboard(
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              keyboardDismissBehavior: .onDrag,
              child: Column(
                spacing: 6,
                children: [
                  Text(
                    "Create question",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextFormField(
                    controller: questionController,
                    decoration: InputDecoration(label: Text("Question")),
                    validator: (value) {
                      return (value != null && value.isEmpty)
                          ? 'question is required'
                          : null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: answer1Controller,
                    decoration: InputDecoration(label: Text("Answer 1")),
                    validator: (value) {
                      return (value != null && value.isEmpty)
                          ? 'Answer 1 is required'
                          : null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: answer2Controller,
                    decoration: InputDecoration(label: Text("Answer 2")),
                    validator: (value) {
                      return (value != null && value.isEmpty)
                          ? 'Answer 2 is required'
                          : null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: answer3Controller,
                    decoration: InputDecoration(label: Text("Answer 3")),
                    validator: (value) {
                      return (value != null && value.isEmpty)
                          ? 'Answer 3 is required'
                          : null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: answer4Controller,
                    decoration: InputDecoration(label: Text("Answer 4")),
                    validator: (value) {
                      return (value != null && value.isEmpty)
                          ? 'Answer 4 is required'
                          : null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: false
                        ? () {}
                        : () {
                            onSubmit(context);
                          },
                    child: Text(false ? "Submitting..." : "Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
