import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/enums.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';
import 'package:kicks_for_nerds/components/text_comp/toggle_bold.dart';
import 'package:kicks_for_nerds/components/text_comp/txt_fonts.dart';

class BiggerButton extends StatefulWidget {
  const BiggerButton({
    Key? key,
    required this.title,
     this.routePage,
    this.buttonHeight,
    this.onPressed,
    this.buttonWidth,
  }) : super(key: key);

  final String? routePage;
  final String title;
  final buttonHeight;
  final buttonWidth;
  final onPressed;

  @override
  _BiggerButtonState createState() => _BiggerButtonState();
}

class _BiggerButtonState extends State<BiggerButton> {
  late font fontType;

  bool hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
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
        child: MyCard(
          cardChild: ToggleBold(
            fontType: hasBeenPressed ? font.bold : font.light,
            boldTxtFont: MyBoldTxtFont(
              clr: kDarkModefont,
              fontsize: kFontSize12,
              text: widget.title,
            ),
            regularTxtFont: MyBoldTxtFont(
              clr: kDarkModefont,
              fontsize: kFontSize12,
              fontW8t: kRegularTxt,
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
