import 'package:flutter/material.dart';


class Results extends StatelessWidget {
  final double score;
  final Function restart;
  Results(this.score, this.restart) {}

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:   CrossAxisAlignment.center,
              children: [
                Text("Your Score", style: TextStyle(fontSize: 40.0)),
                Text("$score/100", style: TextStyle(fontSize: 30.0)),
                SizedBox(height: 150.0),
                RaisedButton(onPressed: restart, child: Text("Reiniciar"))
              ],
            ),
          ],)

        ])
    );
  }
}