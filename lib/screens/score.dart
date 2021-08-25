import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/question_controller.dart';
import './welcome.dart';
import '../styles/text.dart' as style;

class ScoreScreen extends StatelessWidget {
  ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    String _handleResult() {
      int answer = _questionController.numberOfCorrectAnswers;
      if (answer == 4) return 'Hacker';
      if (answer >= 2 && answer <= 3) return 'Pro';
      return 'Newbie';
    }

    void _handleButton() {
      Get.to(() => WelcomeScreen());
    }

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2),
          Text(
              'Quiz Result: \n${_questionController.numberOfCorrectAnswers * 10} out of ${_questionController.questions.length * 10}\n${_handleResult()}',
              style: style.getHeadlineV2Bold()),
          Spacer(flex: 1),
          InkWell(
              onTap: _handleButton,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child:
                      Text('Return to Home', style: style.getFootnoteText()))),
          Spacer(flex: 2)
        ],
      ),
    ));
  }
}
