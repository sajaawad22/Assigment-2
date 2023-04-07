import 'package:flutter/material.dart';
import 'Question.dart';

class QuizScreen extends StatefulWidget {
  final List<Question> questions;
  QuizScreen({required this.questions});
  static const String id = 'QuizScreen';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  List<int> selectedAnswers = [];
  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = widget.questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            "Quiz App ",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentQuestion.questions,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20.0),
              ...currentQuestion.answers
                  .asMap()
                  .entries
                  .map((answer) => buildAnswer(answer.key, answer.value))
                  .toList(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnswer(int index, Answer answer) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (_currentQuestionIndex < widget.questions.length - 1) {
                _currentQuestionIndex++;
                if (answer.correct) {
                  score++;
                }
              } else {
                // Navigate to result page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(score: score),
                  ),
                );
              }
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            onPrimary: Colors.white,
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: 16.0),
                    Text(
                      answer.answerTest,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void calculateScore() {
    for (int i = 0; i < widget.questions.length; i++) {
      if (selectedAnswers[i] >= 0 &&
          widget.questions[i].answers[selectedAnswers[i]].correct) {
        score++;
      }
    }
  }
}

class ResultPage extends StatelessWidget {
  final int score;

  const ResultPage({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String scoreMessage;
    if (score == 0) {
      scoreMessage = "Failed, Try again";
    } else if (score == 1) {
      scoreMessage = "ok, but Try again";
    } else if (score == 2) {
      scoreMessage = "not bad, you could do better";
    } else if (score == 3) {
      scoreMessage = "well done but you could do it better";
    } else if (score == 4) {
      scoreMessage = "Good,nice job";
    } else {
      scoreMessage = "Perfect, you are a hardware expert";
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            "Quiz App",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Total score is $score',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                scoreMessage,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QuizScreen(questions: getQuestions())),
                  );
                },
                child: Text(
                  'Restart The App',
                  style: TextStyle(color: Colors.deepOrange),
                ))
          ],
        ),
      ),
    );
  }
}
