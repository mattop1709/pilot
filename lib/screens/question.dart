// packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// reusable widgets
import '../widgets/progress_bar.dart';
import '../widgets/quiz_option.dart';

// others
import '../controllers/question_controller.dart';
import '../models/questions.dart';

// ignore: must_be_immutable
class QuestionPage extends StatelessWidget {
  QuestionPage({Key? key}) : super(key: key);

  /* need to add controller */
  final QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: _questionController.nextQuestion,
                child: Text('Skip'))
          ],
        ),
        body: Stack(
          children: [
            SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: ProgressBar(),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Obx(() => Text.rich(TextSpan(
                        style: TextStyle(color: Colors.blue),
                        text:
                            'Question ${_questionController.questionNumber.value}',
                        children: [
                          TextSpan(
                              text:
                                  ' of ${(_questionController.questions.length)}')
                        ],
                      ))),
                ),
                Divider(thickness: 1.6),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        onPageChanged: _questionController.updateQuestionNumber,
                        itemCount: _questionController.questions.length,
                        itemBuilder: (context, index) => QuestionCard(
                            question: _questionController.questions[index])))
              ],
            ))
          ],
        ));
  }
}

class QuestionCard extends StatelessWidget {
  QuestionCard({Key? key, required this.question}) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Text(question.question, style: TextStyle(color: Colors.black)),
          SizedBox(height: 16),
          ...List.generate(
              question.options.length,
              (index) => Option(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAnswer(question, index)))
        ],
      ),
    );
  }
}
