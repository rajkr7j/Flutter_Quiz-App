import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }
  //alternate method
  List<String> selectedAnswers = [];

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  var activeScreen = 'start-screen';

  void onStart() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onRestart() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onHome() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = (activeScreen == 'start-screen')
        ? StartScreen(onStart)
        : QuestionsScreen(
            onSelectAnswer: addAnswer,
          );
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
          onRestart: onRestart, onHome: onHome, chosenAnswers: selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 180, 148, 213),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          // child: activeScreen, /*alternate method*/
          child: screenWidget,
        ),
      ),
    );
  }
}
