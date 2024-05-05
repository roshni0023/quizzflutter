import 'package:flutter/material.dart';
import 'package:quizzflutter/screen/mainQuizz.dart';
import 'package:quizzflutter/screen/quizPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizMain(),
    );
  }
}