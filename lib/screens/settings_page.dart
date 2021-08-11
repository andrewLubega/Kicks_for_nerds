import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/services/auth.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomBackButton(),
                ],
              ),
              BiggerButton(
                title: 'Sign out',
                onPressed: () {
                  context.read<AuthService>().signOutFirebaseUser();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
