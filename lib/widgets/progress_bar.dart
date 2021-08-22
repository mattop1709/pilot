import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
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
