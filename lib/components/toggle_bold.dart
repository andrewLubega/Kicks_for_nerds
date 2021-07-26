import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/enums.dart';

class ToggleBold extends StatelessWidget {
  ToggleBold(
      {@required this.fontType,
      @required this.boldTxtFont,
      @required this.lightTxtFont});

  final font fontType;

  final boldTxtFont;
  final lightTxtFont;

  @override
  Widget build(BuildContext context) {
    return Center(child: fontType == font.bold ? boldTxtFont : lightTxtFont);
  }
}
