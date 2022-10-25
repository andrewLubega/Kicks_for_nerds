import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class MyCard extends StatefulWidget {
  MyCard({
    this.height,
    this.width,
    this.baseColour,
    this.cardChild,
    this.marginSize,
    this.grad,
  });

  final marginSize;
  final double? height;
  final Color? baseColour;
  final Widget? cardChild;
  final double? width;
  final grad;

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.cardChild,
      width: widget.width,
      height: widget.height,
      margin: widget.marginSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          kRadiusNumber,
        ),
        color: widget.baseColour,
        gradient: widget.grad,
      ),
    );
  }
}
