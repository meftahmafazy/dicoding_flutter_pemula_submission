import 'package:dicoding_submission/Models/calculator_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}