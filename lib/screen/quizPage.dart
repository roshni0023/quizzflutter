import 'package:flutter/material.dart';
import 'package:quizzflutter/screen/quizAns.dart';

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  PageController pageController = PageController();

  //to store the answer from user
  late List<String?> userAnswer;

  @override
  void initState() {
    userAnswer = List.filled(queAns.length, null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        itemCount: queAns.length,
        itemBuilder: (context, index) {
          return buildQuizPage(index);
        });
  }

  Widget buildQuizPage(int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              queAns[index]['question'],
              style: TextStyle(fontSize: 30,color: Colors.black)
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children:
            List.generate(queAns[index]['options'].length, (optionIndex) {
              //single option from options list
              String option = queAns[index]['options'][optionIndex];
              return InkWell(
                onTap: () {
                  setState(() {
                    //selected option stored to userAnswer list
                    userAnswer[index] = option;
                  });
                },
                child: RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: userAnswer[index],
                  onChanged: (value) {
                    setState(() {
                      userAnswer[index] = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (index < queAns.length - 1) {
                  pageController.nextPage(
                      duration: const Duration(
                          milliseconds: 500),
                      curve: Curves.ease);
                } else {
                  showResult();
                }
              },
              child: Text(
                  index < queAns.length - 1
                      ? "Next" : "Submit"))
        ],
      ),
    );
  }

  void showResult() {
    int correctAns = 0;
    for (int i = 0; i < queAns.length; i++) {
      if (userAnswer[i] == queAns[i]['correctAnswer']) {
        correctAns++;
      }
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'QUIZ Result',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
                "You got $correctAns correct answers out of ${queAns.length} questions"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        });
  }
}