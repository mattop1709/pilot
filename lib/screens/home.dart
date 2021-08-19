import 'package:flutter/material.dart';
import 'package:test_app/widgets/left_bar.dart';
import 'package:test_app/widgets/right_bar.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.title,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 130,
                  child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.red),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Height',
                          hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                          )))),
              Container(
                  width: 130,
                  child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                          color: Colors.red),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Weight',
                          hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                          ))))
            ],
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: _calculateBMI,
            child: Text('Calculate',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
          ),
          SizedBox(height: 50),
          Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 88, color: Colors.blue))),
          SizedBox(height: 10),
          Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                  child: Text(_textResult,
                      style: TextStyle(fontSize: 24, color: Colors.blue)))),
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
          RightBar(barWidth: 80)
        ],
      )),
    );
  }
}
