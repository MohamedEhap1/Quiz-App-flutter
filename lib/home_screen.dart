import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:questions/model.dart';
import 'package:restart_app/restart_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> questionList = getQuestion();
  int countQuestions = 0;
  Answer? selectedAnswer;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Simple Quiz",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white60,
                ),
              ),
              Text(
                "Question ${countQuestions + 1} / ${questionList.length}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: Alignment.center, //يتحكم في الحاجة ال جواه
                    height: 100,
                    width:
                        MediaQuery.of(context).size.width, //بيديلة عرض الشاشة
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      questionList[countQuestions].questiontext.toString(),
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: -20,
                    top: 25,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const Positioned(
                    right: -20,
                    top: 25,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: -27,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.check_sharp,
                          color: Colors.green,
                          size: 35,
                        ),
                      ))
                ],
              ),
              Column(
                children: [
                  for (Answer answer
                      in questionList[countQuestions].answerList!)
                    answerButton(answer),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              nextButton(),
            ],
          ),
        ));
  }

  answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AnimatedButton(
        onPressed: () {
          setState(() {
            selectedAnswer = answer;
          });
        },
        color: isSelected ? Colors.orange : Colors.white,
        child: Text(answer.text.toString()),
      ),
    );
  }

  nextButton() {
    bool isLastQuestion = false;
    if (questionList.length - 1 == countQuestions) isLastQuestion = true;
    return AnimatedButton(
      onPressed: () {
        if (selectedAnswer!.isCorrect!) score++;
        if (selectedAnswer != null) {
          if (isLastQuestion) {
            bool isPassed = false;
            if (score >= questionList.length / 2.0) isPassed = true;
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => AlertDialog(
                  title: Text(
                    "${isPassed ? 'Passed' : 'Failed'} | Score is $score",
                    style: TextStyle(
                      color: isPassed ? Colors.green : Colors.red,
                    ),
                  ),
                  content: SizedBox(
                      height: 80,
                      child: Center(
                          child: AnimatedButton(
                        width: 100,
                        height: 50,
                        onPressed: () {
                          score = 0;
                          countQuestions = 0;
                          selectedAnswer = null;
                          Navigator.pop(context);
                          Restart.restartApp();
                        },
                        color: Colors.black,
                        child: const Text(
                          "Restart",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )))),
            );
          } else {
            setState(() {
              countQuestions++;
              selectedAnswer = null;
            });
          }
        }
      },
      width: 270,
      child: Text(isLastQuestion ? "Submit" : "Next"),
    );
  }
}
