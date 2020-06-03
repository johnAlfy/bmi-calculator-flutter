import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/repeated_container.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiState;
  final String bmiAdvice;

  ResultPage(
      {@required this.bmiResult,
      @required this.bmiState,
      @required this.bmiAdvice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "YOUR RESULT",
                style: kTitleResultKeyWordStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: RepeatedContainer(
                color: kInActiveIconColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiState.toUpperCase(),
                      style: kResultText,
                    ),
                    Text(
                      bmiResult.toUpperCase(),
                      style: kBMIResult,
                    ),
                    Text(
                      bmiAdvice.toUpperCase(),
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: "RE-CALCULATE",
          )
        ],
      ),
    );
  }
}
