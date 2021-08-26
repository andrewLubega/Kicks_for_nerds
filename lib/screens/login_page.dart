import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/under_button_txt.dart';
import 'package:kicks_for_nerds/services/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: SafeArea(
        child: Form(
          key: _formKey,
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
                      'Login',
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
                txt: kEmailTxt,
                hiddenPass: false,
                onChangedProperty: (val) {
                  setState(
                    () => email = val.trim(),
                  );
                },
              ),
              StrokeButtonField(
                txt: kPasswordTxt,
                hiddenPass: true,
                onChangedProperty: (val) {
                  setState(() => password = val.trim());
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: BiggerButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      // dynamic result = await _auth.signInWithEmailAndPassword(
                      //     email: email, password: password);
                      dynamic result = await context
                          .read<AuthService>()
                          .loginFirebaseUser(email, password);
                      if (result == null) {
                        setState(() => error = 'error, could not sign in user');
                      } else {
                        print(
                          result,
                        );
                        setState(() {
                          Navigator.pushNamed(
                            context,
                            '/profile',
                          );
                        });
                      }
                    } else {
                      setState(
                        () {
                          error = 'please supply a valid email';
                          loading = false;
                        },
                      );
                    }
                  },
                  title: 'Next',
                  buttonHeight: vNormalButtonHeight,
                ),
              ),
              UnderButtonTxt(
                txt: 'Forgot password?',
                routeName: '/forgot',
              ),
              SizedBox(
                height: 134,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// onPressed: () async {
//                     if (_formKey.currentState.validate()) {
//                       dynamic result = await _auth.registerWithEmailAndPassword(
//                         email,
//                         password,
//                       );
//                     },}