import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'reusable_card.dart';
import 'toggle_bold.dart';
import 'txt_fonts.dart';
import 'package:kicks_for_nerds/assets/enums.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/assets/variables.dart';

//small button

class SmallButton extends StatefulWidget {
  const SmallButton({
    Key key,
    @required this.title,
    this.routePage,
    this.buttonHeight,
    this.buttonWidth,
  }) : super(key: key);

  final String routePage;
  final String title;
  final buttonHeight;
  final buttonWidth;

  @override
  _SmallButtonState createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  font fontType;

  bool hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(
          () {
            hasBeenPressed = !hasBeenPressed;
          },
        );
        Navigator.pushNamed(
          context,
          widget.routePage,
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusNumber),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: hasBeenPressed ? lGradClr : lSolidGrad),
          borderRadius: BorderRadius.circular(kRadiusNumber),
        ),
        child: ReusableCard(
          cardChild: ToggleBold(
            fontType: hasBeenPressed ? font.bold : font.light,
            boldTxtFont: ReusbaleBoldTxtFont(
              fontsize: kFontSize18,
              text: widget.title,
            ),
            lightTxtFont: ReusableLightTxtFont(
              fontsize: kFontSize18,
              fontW8t: kLightTxt,
              text: widget.title,
            ),
          ),
          height: vNormalButtonHeight.toDouble(),
          width: 158,
        ),
      ),
    );
  }
}

//bigger button

class BiggerButton extends StatefulWidget {
  const BiggerButton({
    Key key,
    @required this.title,
    this.routePage,
    this.buttonHeight,
    this.buttonWidth,
  }) : super(key: key);

  final String routePage;
  final String title;
  final buttonHeight;
  final buttonWidth;

  @override
  _BiggerButtonState createState() => _BiggerButtonState();
}

class _BiggerButtonState extends State<BiggerButton> {
  font fontType;

  bool hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(
          () {
            hasBeenPressed = !hasBeenPressed;
          },
        );
        Navigator.pushNamed(
          context,
          widget.routePage,
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusNumber),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: hasBeenPressed ? lGradClr : lSolidGrad),
          borderRadius: BorderRadius.circular(kRadiusNumber),
        ),
        child: ReusableCard(
          cardChild: ToggleBold(
            fontType: hasBeenPressed ? font.bold : font.light,
            boldTxtFont: ReusbaleBoldTxtFont(
              fontsize: kFontSize12,
              text: widget.title,
            ),
            lightTxtFont: ReusableLightTxtFont(
              fontsize: kFontSize12,
              fontW8t: kLightTxt,
              text: widget.title,
            ),
          ),
          height: vNormalButtonHeight.toDouble(),
          width: 327,
        ),
      ),
    );
  }
}
