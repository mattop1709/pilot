import 'package:flutter/material.dart';
import 'package:test_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String appTitle = 'BMI Calculator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: this.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(title: this.appTitle),
    );
  }
}
