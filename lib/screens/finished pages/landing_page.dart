import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/buttons_comp/small_button.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';
import 'package:kicks_for_nerds/components/landing_page_nav.dart';
import 'package:kicks_for_nerds/components/buttons_comp/profile_buttons.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/login_page.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/first_register_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg_shoe_pic.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyCard(
              marginSize: kTopContentMargin,
              height: 118,
              baseColour: Colors.white,
            ),
            // banner
            MyCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(
                  64.0,
                ),
                child: Image.asset(
                  'images/KFN_logo.png',
                ),
              ),
              marginSize: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 68,
              ),
              baseColour: kBlackCustomClr,
              height: 236,
            ),
            // nav
            LandingPageNav(
              cardChild: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SmallButton(
                      buttonHeight: vNormalButtonHeight,
                      buttonWidth: vSmallButtonWidth,
                      title: 'Login',
                      routePage: LoginPage(),
                    ),
                    SmallButton(
                      buttonHeight: vNormalButtonHeight,
                      buttonWidth: vSmallButtonWidth,
                      title: 'Register',
                      routePage: FirstRegisterPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
