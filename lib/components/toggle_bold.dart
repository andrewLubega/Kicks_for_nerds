import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/enums.dart';

class ToggleBold extends StatelessWidget {
  ToggleBold(
      {@required this.fontType,
      @required this.boldTxtFont,
      @required this.regularTxtFont});

  final font fontType;

  final boldTxtFont;
  final regularTxtFont;

  @override
  Widget build(BuildContext context) {
    return Center(child: fontType == font.bold ? boldTxtFont : regularTxtFont);
  }
}
