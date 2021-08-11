import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/under_button_txt.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                    'Forgot Password',
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
              hiddenPass: false,
              txt: 'E-mail address',
            ),
            StrokeButtonField(
              hiddenPass: false,
              txt: '+1 Phone',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: BiggerButton(
                routePage: '/load',
                title: 'Next',
                buttonHeight: vNormalButtonHeight,
              ),
            ),
            UnderButtonTxt(
              txt: 'Don\'t have an account?',
              routeName: '/reg',
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
