import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';

void main() {
  runApp(const BMICalculator());
}
class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes:{
      //   '/': (context)=>InputPage(),
      //   '/result': (context)=> ResultsPage(),
      // },
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}