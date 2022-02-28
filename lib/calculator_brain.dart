import 'dart:math';

class CalculatorBrain {
  final int bmiHeight;
  final int bmiWeight;
  double _bmi = 0.0;

  CalculatorBrain(
    this.bmiHeight,
    this.bmiWeight,
  );

  String bmiNo() {
    _bmi = bmiWeight / pow((bmiHeight / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiText() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String bmiInterpretation() {
    if (_bmi >= 25) {
      return "Do some excercise daily.So you can loss your weight";
    } else if (_bmi > 18) {
      return "Good, you are normal";
    } else {
      return "Eat some food and vagitable to gain the weight";
    }
  }
}
