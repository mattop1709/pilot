import 'package:flutter/material.dart';
import 'package:test_app/widgets/app_bar.dart';
import 'package:test_app/widgets/form.dart';
import 'package:test_app/widgets/left_bar.dart';
import 'package:test_app/widgets/right_bar.dart';
import '../styles/text.dart' as styles;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* properties */
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';

  /* method */
  void _calculateBMI() {
    double _height = double.parse(_heightController.text);
    double _weight = double.parse(_weightController.text);
    setState(() {
      _bmiResult = _weight / (_height * _height);

      if (_bmiResult > 25) {
        _textResult = 'Over Weight';
      }

      if (_bmiResult >= 18.5 && _bmiResult <= 25) {
        _textResult = 'Normal Weight';
      }

      if (_bmiResult < 18.5) {
        _textResult = "Under Weight";
      }
    });
  }

/* render */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomForm(controller: _heightController, caption: 'Height'),
              CustomForm(controller: _weightController, caption: 'Weight'),
            ],
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: _calculateBMI,
            child: Text('Calculate', style: styles.getButton()),
          ),
          SizedBox(height: 16),
          Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: styles.getHeaderText())),
          SizedBox(height: 10),
          Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                  child: Text(_textResult, style: styles.getFootnoteText()))),
          SizedBox(height: 40),
          LeftBar(barWidth: 40),
          SizedBox(height: 10),
          LeftBar(barWidth: 160),
          SizedBox(height: 10),
          LeftBar(barWidth: 80),
          SizedBox(height: 10),
          RightBar(barWidth: 40),
          SizedBox(height: 10),
          RightBar(barWidth: 160),
          SizedBox(height: 10),
          RightBar(barWidth: 70)
        ],
      )),
    );
  }
}
