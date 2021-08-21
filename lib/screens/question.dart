import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/question_controller.dart';

// ignore: must_be_immutable
class QuestionPage extends StatelessWidget {
  QuestionPage({Key? key}) : super(key: key);

  /* need to add controller */
  QuestionController _questionController = Get.put(QuestionController());

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
              ],
            ))
          ],
        ));
  }
}

class ProgressBar extends StatelessWidget {
  ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 32,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 2),
          borderRadius: BorderRadius.circular(48)),
      child: GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (controller) {
            /* timer handler */
            String timer() {
              int totalTime = 60;
              int time = (controller.animation.value * 60).round();
              int result = totalTime - time;

              String handleSecond() {
                if (result <= 1) {
                  return 'second';
                }
                return 'seconds';
              }

              return '${(result)} ${(handleSecond())} left';
            }

            return Stack(
              children: [
                LayoutBuilder(
                    builder: (context, constraints) => Container(
                          width:
                              constraints.maxWidth * controller.animation.value,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(48)),
                        )),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(timer()),
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
