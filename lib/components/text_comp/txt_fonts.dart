import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

// Bold font classes
class MyBoldTxtFont extends StatelessWidget {
  MyBoldTxtFont({
    required this.text,
    this.fontW8t,
    required this.fontsize,
    this.clr,
  });

  final String text;
  final fontW8t;
  final fontsize;
  final clr;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: clr,
        fontWeight: fontW8t,
        fontSize: fontsize,
      ),
    );
  }
}

// Light font classes
class MyRegularTxtFont extends StatelessWidget {
  MyRegularTxtFont({
    required this.text,
    required this.fontW8t,
    required this.fontsize,
    this.clr,
  });

  final String text;
  final fontW8t;
  final fontsize;
  final clr;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: fontsize,
        color: clr,
        fontWeight: fontW8t,
      ),
    );
  }
}
