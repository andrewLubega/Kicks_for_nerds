import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';

class SecondRegisterPage extends StatefulWidget {
  @override
  _SecondRegisterPageState createState() => _SecondRegisterPageState();
}

class _SecondRegisterPageState extends State<SecondRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomBackButton(),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 0, 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Register ',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 36,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            StrokeButtonField(
              txt: kUserTxt,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: BiggerButton(
                routePage: '/log',
                title: 'Sign Up',
                buttonHeight: vNormalButtonHeight,
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 24.0,
                    top: 12,
                  ),
                  child: Text(
                    'By signing up, you agree to Photo’s Terms of Service and Privacy Policy.',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 134,
            ),
          ],
        ),
      ),
    );
  }
}
