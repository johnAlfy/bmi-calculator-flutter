import 'package:flutter/material.dart';

enum GenderType { male, female }
GenderType selectedGender;
int height = 180;
int weight = 60;
int age = 25;

const kActiveIconColor = Color(0xFF1D1F33);
const kInActiveIconColor = Color(0xFF111328);
const kBottomButtonColor = Color(0xFFEA1556);
const kBottomButtonHeight = 80.0;
const double kIconSize = 80;

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);
const kNumberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
const kButton = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);
const kTitleResultKeyWordStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);
const kResultText = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Color(0xFF24D876),
);
const kBMIResult = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 100,
);
const kBodyTextStyle = TextStyle(fontSize: 22);
