class Question {
  String text;
  bool correct = false;
  List<Answer> answers;

  Question({this.text, this.answers});
}

class Answer {
  String text;
  bool correct = false;

  Answer(this.text, this.correct);
}
