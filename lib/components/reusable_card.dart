import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.height,
      this.width,
      this.baseColour,
      this.cardChild,
      this.marginSize,
      this.grad});

  final marginSize;
  final double height;
  final Color baseColour;
  final Widget cardChild;
  final double width;
  final grad;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      width: width,
      height: height,
      margin: marginSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kRadiusNumber,
        ),
        color: baseColour,
        gradient: grad,
      ),
    );
  }
}
