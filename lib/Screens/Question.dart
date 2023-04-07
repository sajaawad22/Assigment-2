class Question {
  final String questions;
  final List<Answer> answers;

  Question(this.questions, this.answers);
}

class Answer {
  final String answerTest;
  final bool correct;
  Answer(this.answerTest, this.correct);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(
    Question(
      "What does RAM stand for?",
      [
        Answer("Random Access Memory", true),
        Answer("Read Always Memory", false),
        Answer("Retrieve Alternate Memory", false),
        Answer("Run all Machines", false),
      ],
    ),
  );
  list.add(
    Question(
      "Choose two output devices:",
      [
        Answer("Monitor and Scanner", false),
        Answer("Speakers and printer", true),
        Answer("Mouse and keyboard", false),
        Answer("CPU and RAM", false),
      ],
    ),
  );
  list.add(
    Question(
      "What does ROM stand for?",
      [
        Answer("Read one memory", false),
        Answer("Relative only memory", false),
        Answer("Reciprocate once map", false),
        Answer("Read- only memory", true),
      ],
    ),
  );
  list.add(
    Question(
      "What are examples of Storage devices?",
      [
        Answer("CPU and RAM", false),
        Answer("Keyboards and flash drive", false),
        Answer("Hard drive and flash drive", true),
        Answer("Printer and keyboards", false),
      ],
    ),
  );
  list.add(
    Question(
      "Name the brain of the computer that does the calculation, moving, and processing of information.",
      [
        Answer("CPU", true),
        Answer("RAM", false),
        Answer("Hard Drive", false),
        Answer("Motherboard", false),
      ],
    ),
  );

  return list;
}
