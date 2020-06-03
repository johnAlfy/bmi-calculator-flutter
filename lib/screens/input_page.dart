import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/repeated_container.dart';
import '../components/gender_container.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/rounded_icon_button.dart';
import '../bmi_brain.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

void showToast() {
  Fluttertoast.showToast(
      msg: "Please choose a gender !",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: kActiveIconColor,
      fontSize: 22,
      textColor: Colors.white);
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RepeatedContainer(
                        color: selectedGender == GenderType.male
                            ? kActiveIconColor
                            : kInActiveIconColor,
                        child: GenderWidget(
                          "MALE",
                          FontAwesomeIcons.mars,
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.male;
                          });
                        }),
                  ),
                  Expanded(
                    child: RepeatedContainer(
                        color: selectedGender == GenderType.female
                            ? kActiveIconColor
                            : kInActiveIconColor,
                        child: GenderWidget("FEMALE", FontAwesomeIcons.venus),
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RepeatedContainer(
                      color: kActiveIconColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "HEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                "cm",
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RepeatedContainer(
                      color: kActiveIconColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButoon(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight >= 250 ? weight = 1 : weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundedIconButoon(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight == (1) ? weight = 1 : weight--;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: RepeatedContainer(
                        color: kActiveIconColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "AGE",
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundedIconButoon(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age >= 140 ? age = 1 : age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundedIconButoon(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      age == (1) ? age = 1 : age--;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                if (selectedGender != null) {
                  BmiBrain bmi = BmiBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: bmi.bmiCalculator(),
                              bmiState: bmi.getWeightState(),
                              bmiAdvice: bmi.getWeightAdvice(),
                            )),
                  );
                } else {
                  showToast();
                }
              },
              text: "CALCULATE",
            ),
          ],
        ));
  }
}
