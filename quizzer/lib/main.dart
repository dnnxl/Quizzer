import 'package:flutter/material.dart';
import 'brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int score = 0;
  Brain brain = new Brain();

  void checkAnswer(bool option) {
    bool correctAnswer = brain.getCorrectAnswer();
    if (correctAnswer == option) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      score++;
    } else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    }
    brain.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  checkAnswer(true);
                  var isfinal = brain.isFinal();
                  if (isfinal == true) {
                    _onBasicAlertPressed(context);
                    brain = new Brain();
                    scoreKeeper = [];
                    score = 0;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  checkAnswer(false);
                  var isfinal = brain.isFinal();
                  if (isfinal == true) {
                    _onBasicAlertPressed(context);
                    brain = new Brain();
                    scoreKeeper = [];
                    score = 0;
                  }
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  _onBasicAlertPressed(context) {
    int total = brain.getTotalQuestions();
    Alert(
            context: context,
            title: "Game finished",
            desc: "The game has finished. Score $score / $total ")
        .show();
  }
}
