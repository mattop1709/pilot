// package
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

// path
import './screens/welcome.dart';
// import './screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'BMI Calculator';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: this.appTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: WelcomePage());
  }
}
