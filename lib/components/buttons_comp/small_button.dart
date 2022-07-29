import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/enums.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';
import 'package:kicks_for_nerds/components/text_comp/toggle_bold.dart';
import 'package:kicks_for_nerds/components/text_comp/txt_fonts.dart';

class SmallButton extends StatefulWidget {
  const SmallButton({
    Key key,
    @required this.title,
    this.routePage,
    this.buttonHeight,
    this.buttonWidth,
  }) : super(key: key);

  final Widget routePage;
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.routePage),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            kRadiusNumber,
          ),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: hasBeenPressed ? lGradClr : lSolidGrad),
          borderRadius: BorderRadius.circular(
            kRadiusNumber,
          ),
        ),
        child: MyCard(
          cardChild: ToggleBold(
            fontType: hasBeenPressed ? font.bold : font.light,
            boldTxtFont: MyBoldTxtFont(
              fontW8t: kBoldTxt,
              fontsize: kFontSize18,
              text: widget.title,
            ),
            regularTxtFont: MyRegularTxtFont(
              fontsize: kFontSize18,
              fontW8t: kRegularTxt,
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
