import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 0, 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 36,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            StrokeButton(
              txt: 'Username',
            ),
            StrokeButton(
              txt: 'Password',
            ),
            BiggerButton(
              title: 'Next',
              buttonHeight: vNormalButtonHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, right: 24),
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: kFontSize12,
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


// cardChild: ReusableCard(
                //   marginSize: kContentMargin,
                //   baseColour: kBaseWidgetColor,
                //   width: 327,
                //   height: 50,
                //   cardChild: TextFormField(
                //     decoration: InputDecoration(
                //       contentPadding: EdgeInsets.fromLTRB(
                //         24,
                //         30,
                //         24,
                //         0,
                //       ),
                //       hintText: 'Name',
                //       border: OutlineInputBorder(
                //         borderSide: BorderSide.none,
                //       ),
                //     ),
                //   ),
                // ),