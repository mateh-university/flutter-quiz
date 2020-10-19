import 'package:flutter/material.dart';
import './models/question.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  double score = 0;
  double _progressValue = 0;

  List<Question> questions = [
    new Question(text: "Why am doing this?", answers: [
      new Answer("Porque el profe me mando", false),
      new Answer("Amo la programacion!", true),
      new Answer("Ambas son correctas", false)
    ]),
    new Question(text: "What day is today?", answers: [
      new Answer("Wednesday!", false),
      new Answer("Yesterday!", false),
      new Answer("Today!", true)
    ]),
    new Question(text: "Your score", answers: [])
  ];

  List<Answer> userAnswers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Mateh Quiz!!",
          style: TextStyle(color: Colors.red[50]),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Container(
            child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  '${selectedIndex == questions.length - 1 ? selectedIndex : selectedIndex + 1}/${questions.length - 1} Questions!',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18.0, letterSpacing: 1.5)),
            ],
          ),
          SizedBox(height: 5.0),
          LinearProgressIndicator(
            backgroundColor: Colors.cyanAccent,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
            value: _progressValue,
          ),
          SizedBox(height: 100),
          Center(
            child: Text(this.questions[this.selectedIndex].text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 2.0)),
          ),
          SizedBox(height: 40.0),
          ...this.questions[this.selectedIndex].answers.map((a) {
            return Column(children: [
              RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (a.correct) {
                        this.questions[this.selectedIndex].correct = true;
                      }
                      selectedIndex++;
                      print("$selectedIndex, ${this.questions.length}");
                      if (selectedIndex <= this.questions.length - 2) {
                        this._progressValue =
                            this.selectedIndex / this.questions.length;
                      } else {
                        print('elser');
                        this._progressValue = 100;
                        int correctCount = 0;
                        for (var i = 0; i < this.questions.length - 1; i++) {
                          if (this.questions[i].correct) {
                            correctCount++;
                          }
                        }

                        this.score =
                            (correctCount / (this.questions.length - 1)) * 100;
                      }
                    });
                  },
                  color: Colors.grey,
                  child: Text(a.text,
                      style: TextStyle(color: Colors.white, fontSize: 15)))
            ]);
          }),
          selectedIndex == questions.length - 1
              ? Text("$score/100", style: TextStyle(fontSize: 30.0))
              : Text('')
        ])),
      ),
    );
  }
}
