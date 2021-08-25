import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './question.dart';
import '../styles/text.dart' as style;

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 2,
                ),
                Text('Let\'s Play Quiz', style: style.getHeadlineV2Bold()),
                Text('Enter your information below',
                    style: style.getFootnoteText()),
                Spacer(flex: 1),
                TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: 'Full name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)))),
                ),
                Spacer(flex: 1),
                InkWell(
                    onTap: () => Get.to(() => QuestionPage()),
                    child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Text('Start', style: style.getFootnoteText()))),
                Spacer(flex: 2)
              ],
            ),
          ),
        )
      ],
    ));
  }
}
