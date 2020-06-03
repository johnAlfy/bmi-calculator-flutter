import 'package:flutter/cupertino.dart';
import 'dart:math';

class BmiBrain {
  final int height;
  final int weight;
  double _bmi;
  BmiBrain({@required this.height, @required this.weight});

  String bmiCalculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getWeightState() {
    if (_bmi >= 25)
      return "OverWeight";
    else if (_bmi < 18)
      return "Normal";
    else
      return "UnderWeight";
  }

  String getWeightAdvice() {
    if (_bmi >= 25)
      return "you have a higher than normal body weight , try to exercise more.!";
    else if (_bmi < 18)
      return "you have a normal body weight , Good job !";
    else
      return "you have a lower than normal body weight , you can eat a bit more.!";
  }
}
