import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/text_comp/toggle_bold.dart';
import '../my_comp/my_card.dart';
import '../text_comp/txt_fonts.dart';
import 'package:kicks_for_nerds/assets/enums.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/assets/variables.dart';

//small button

class FollowButton extends StatefulWidget {
  const FollowButton({
    Key key,
    @required this.title,
    this.routePage,
    this.buttonHeight,
    this.onPressed,
    this.buttonWidth,
  }) : super(key: key);

  final Widget routePage;
  final String title;
  final buttonHeight;
  final buttonWidth;
  final onPressed;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
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
          gradient: LinearGradient(
            colors: hasBeenPressed ? lGradClr : lSolidGrad,
          ),
          borderRadius: BorderRadius.circular(
            kRadiusNumber,
          ),
        ),
        child: MyCard(
          cardChild: ToggleBold(
            fontType: hasBeenPressed ? font.bold : font.light,
            boldTxtFont: MyBoldTxtFont(
              fontW8t: kBoldTxt,
              fontsize: kFontSize12,
              text: widget.title,
            ),
            regularTxtFont: MyRegularTxtFont(
              fontsize: kFontSize12,
              fontW8t: kRegularTxt,
              text: widget.title,
            ),
          ),
          height: widget.buttonHeight,
          width: widget.buttonWidth,
        ),
      ),
    );
  }
}

class MessageButton extends StatefulWidget {
  const MessageButton({
    Key key,
    @required this.title,
    this.routePage,
    this.buttonHeight,
    this.onPressed,
    this.buttonWidth,
    this.routeName,
  }) : super(key: key);

  final Widget routePage;
  final String title;
  final buttonHeight;
  final buttonWidth;
  final onPressed;
  final String routeName;

  @override
  State<MessageButton> createState() => _MessageButtonState();
}

class _MessageButtonState extends State<MessageButton> {
  font fontType;

  bool hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          hasBeenPressed = !hasBeenPressed;
        });
        Navigator.pushNamed(
          context,
          widget.routeName,
        );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => widget.routePage,
        //   ),
        // );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadiusNumber),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: hasBeenPressed ? lGradClr : lSolidGrad,
          ),
          borderRadius: BorderRadius.circular(kRadiusNumber),
        ),
        child: MyCard(
          cardChild: ToggleBold(
            fontType: hasBeenPressed ? font.bold : font.light,
            boldTxtFont: MyBoldTxtFont(
              fontW8t: kBoldTxt,
              fontsize: kFontSize12,
              text: widget.title,
            ),
            regularTxtFont: MyRegularTxtFont(
              fontsize: kFontSize12,
              fontW8t: kRegularTxt,
              text: widget.title,
            ),
          ),
          height: widget.buttonHeight,
          width: widget.buttonWidth,
        ),
      ),
    );
  }
}

//bigger button



//  setState(
//           () {
//             hasBeenPressed = !hasBeenPressed;
//           },
//         );
// Navigator.pushNamed(
//               context,
//              widget.routePage,
//         ); 