import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class LandingPageNav extends StatelessWidget {
  LandingPageNav({this.cardChild});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.only(top: 221),
      height: 109,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kTopBoxCurves,
      ),
    );
  }
}
