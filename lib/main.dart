import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/Question.dart';
import 'Screens/Quiz_Screen.dart';

void main() async {
  runApp(DuoAct());
}

class DuoAct extends StatelessWidget {
  const DuoAct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: QuizScreen.id,
      routes: {
        QuizScreen.id: (context) => QuizScreen(questions: getQuestions()),
      },
    );
  }
}
