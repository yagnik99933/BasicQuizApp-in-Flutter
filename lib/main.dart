import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  final questions = const [
    {
      'questionText': 'What\'s your favourite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal ?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 7},
        {'text': 'Lion', 'score': 5},
        {'text': 'Dog', 'score': 3},
      ],
    },
    {
      'questionText': 'Who\'s your favourite Instructor ?',
      'answers': [
        {'text': 'Abhi', 'score': 10},
        {'text': 'Navin reddy', 'score': 7},
        {'text': 'Joggesh Muppala', 'score': 5},
        {'text': 'Max', 'score': 3},
      ],
    }
  ];

  void answerQuestion(int score) {
    totalScore = score + totalScore;

    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My Quiz App'),
      ),
      body: questionIndex < questions.length
          ? Quiz(
              answerQuestion: answerQuestion,
              questionIndex: questionIndex,
              questions: questions,
            )
          : Result(totalScore, resetQuiz),
    ));
  }
}
