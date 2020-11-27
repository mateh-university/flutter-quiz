import 'package:flutter/material.dart';
import './models/question.dart';
import 'results.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  int _selectedIndex = 0;
  int correctCount = 0;
  double score = 0;
  double _progressValue = 0;
  bool showResults = false;
  bool darkMode = false;

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
    new Question(text: "Navidad es en el mes de:", answers: [
      new Answer("Enero", false),
      new Answer("Junio", false),
      new Answer("Diciembre", true)
    ]),
    new Question(text: "Cuanto es 2 + 2", answers: [
      new Answer("-1", false),
      new Answer("4", true),
      new Answer("22", false)
    ]),
    new Question(text: "HTML es...", answers: [
      new Answer("Un lenguaje de programacion", false),
      new Answer("Memoria RAM", false),
      new Answer("Un lenguaje de etiquetado ", true)
    ]),
  ];

  List<Answer> userAnswers;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: this.darkMode ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Mateh Quiz!!!",
              style: TextStyle(color: Colors.red[50]),
            ),
            backgroundColor: Colors.redAccent,
          ),
          body: Padding(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: !showResults ? Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        // ignore: unnecessary_brace_in_string_interps
                          'Preguntas contestadas: ${selectedIndex}/${questions.length }',
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
                    child: Text(this.questions[this._selectedIndex].text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            letterSpacing: 2.0)),
                  ),
                  SizedBox(height: 40.0),
                  ...this.questions[this._selectedIndex].answers.map((a) {
                    return Column(children: [
                      RaisedButton(
                          onPressed: () {
                            setState(() {
                              if (a.correct) {
                                correctCount++;
                                this.questions[this.selectedIndex].correct = true;
                                this.score =
                                    (correctCount / (this.questions.length )) * 100;

                                // ignore: unnecessary_brace_in_string_interps
                                print('score ${score}');
                              }
                              if(_selectedIndex == questions.length -1){
                                showResults = true;
                              }

                              if(selectedIndex != questions.length -1)
                                _selectedIndex++;

                              selectedIndex++;
                              print("$selectedIndex, ${this.questions.length}");
                              // if (selectedIndex < this.questions.length ) {
                              this._progressValue =
                                  this.selectedIndex / this.questions.length;
                              // }
                            });
                          },
                          color: Colors.grey,
                          child: Text(a.text,
                              style: TextStyle(color: Colors.white, fontSize: 15)))
                    ]);
                  }),
                ])) : Results(score, (){
              setState(() {
                this.showResults = false;
                this.score = 0;
                this._selectedIndex = 0;
                this.selectedIndex = 0;
                this.correctCount = 0;
                this._progressValue = 0;
              });
            }
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon( Icons.autorenew),
            onPressed: (){

              if (darkMode == false) {
                setState(() {
                  darkMode = true;
                });
              } else {
                setState(() {
                  darkMode = false;
                });
              }

            },
          ),
        )
    );
  }
}
