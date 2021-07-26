import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
// import 'package:kicks_for_nerds/assets/constants.dart';
// import 'package:kicks_for_nerds/components/reusable_card.dart';
import 'txt_form.dart';

class StrokeButton extends StatelessWidget {
  StrokeButton({this.txt});

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 10,
      ),
      child: OutlinedButton(
        onPressed: () {},
        child: TxtForm(
          txt: txt,
        ),
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            kBlackCustomClr,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                kRadiusNumber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


  // decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(
  //         kRadiusNumber,
  //       ),