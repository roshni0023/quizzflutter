import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzflutter/screen/quizPage.dart';

class QuizMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mini Quiz App"),),
      body: QuizPage(),
    );
  }
}