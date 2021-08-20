import 'package:flutter/material.dart';
import '../styles/text.dart' as styles;

class CustomForm extends StatelessWidget {
  CustomForm({Key? key, required this.controller, required this.caption})
      : super(key: key);

  final TextEditingController controller;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: styles.getFormText(),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: caption,
                hintStyle: styles.getFormText())));
  }
}
