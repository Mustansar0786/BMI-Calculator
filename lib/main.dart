import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: const InputPage(),
      //* COPY WITH METHOD
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      //* methode to change the color of
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color(0xff0a0e21),
      //   ),
      //   scaffoldBackgroundColor: const Color(0xff0a0e21),
      //   textTheme: const TextTheme(
      //     bodyText2: TextStyle(color: Colors.white),
      //   ),
      // ),
    );
  }
}
