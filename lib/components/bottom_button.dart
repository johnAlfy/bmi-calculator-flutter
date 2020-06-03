import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  BottomButton({@required this.onTap, @required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kButton,
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomButtonColor,
        width: double.infinity,
        height: kBottomButtonHeight,
      ),
    );
  }
}
