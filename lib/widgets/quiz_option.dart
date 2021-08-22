import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/question_controller.dart';

class Option extends StatelessWidget {
  Option(
      {Key? key, required this.text, required this.index, required this.press})
      : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (questionController) {
          Color getTheRightColor() {
            if (questionController.isAnswered) {
              if (index == questionController.correctAnswer) {
                return Colors.green;
              } else if (index == questionController.selectedAnswer &&
                  questionController.selectedAnswer !=
                      questionController.correctAnswer) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
              onTap: press,
              child: Container(
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(color: getTheRightColor()),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${index + 1}. $text',
                        style:
                            TextStyle(color: getTheRightColor(), fontSize: 16)),
                    Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: getTheRightColor() == Colors.grey
                              ? Colors.transparent
                              : getTheRightColor(),
                          borderRadius: BorderRadius.circular(48),
                          border: Border.all(color: getTheRightColor()),
                        ),
                        child: getTheRightColor() == Colors.grey
                            ? null
                            : Icon(getTheRightIcon(), size: 16))
                  ],
                ),
              ));
        });
  }
}
