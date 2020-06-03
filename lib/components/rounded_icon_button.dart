import 'package:flutter/material.dart';

class RoundedIconButoon extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundedIconButoon({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onLongPress: onPress,
    );
  }
}
