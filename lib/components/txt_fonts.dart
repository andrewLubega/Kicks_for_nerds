import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

// Bold font classes
class ReusbaleBoldTxtFont extends StatelessWidget {
  ReusbaleBoldTxtFont({
    @required this.text,
    this.fontW8t,
    @required this.fontsize,
  });

  final String text;
  final fontW8t;
  final fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: kFontColour,
        fontWeight: fontW8t,
        fontSize: fontsize,
      ),
    );
  }
}

// Light font classes
class ReusableLightTxtFont extends StatelessWidget {
  ReusableLightTxtFont({
    @required this.text,
    @required this.fontW8t,
    @required this.fontsize,
  });

  final String text;
  final fontW8t;
  final fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: fontsize,
        color: kFontColour,
        fontWeight: fontW8t,
      ),
    );
  }
}
