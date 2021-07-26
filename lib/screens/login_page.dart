import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: SafeArea(
        child: Center(
          child: Text('Login Page'),
        ),
      ),
    );
  }
}
