import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/buttons_comp/bigger_button.dart';
import 'package:kicks_for_nerds/components/buttons_comp/profile_buttons.dart';
import 'package:kicks_for_nerds/components/buttons_comp/stroke_button.dart';
import 'package:kicks_for_nerds/components/buttons_comp/under_button_txt.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/services/auth.dart';
import 'package:provider/provider.dart';

class FirstRegisterPage extends StatefulWidget {
  @override
  _FirstRegisterPageState createState() => _FirstRegisterPageState();
}

class _FirstRegisterPageState extends State<FirstRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String legalName = '';
  String userName = '';
  String error = '';
  // String username = '';
  String phone = '';
  // final AuthService _auth = AuthService();
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
              // StrokeButtonField(
              //   onChangedProperty: (val) {
              //     setState(
              //       () => username = val.trim(),
              //     );
              //   },
              //   txt: kUserTxt,
              // ),
              StrokeButtonField(
                hiddenPass: false,
                onChangedProperty: (val) {
                  setState(
                    () => email = val.trim(),
                  );
                },
                txt: kEmailTxt,
              ),
              StrokeButtonField(
                hiddenPass: false,
                onChangedProperty: (val) {
                  setState(
                    () => password = val.trim(),
                  );
                },
                txt: kPasswordTxt,
              ),
              StrokeButtonField(
                hiddenPass: false,
                onChangedProperty: (val) {
                  setState(
                    () => legalName = val.trim(),
                  );
                },
                txt: kfNameTxt,
              ),
              StrokeButtonField(
                hiddenPass: false,
                onChangedProperty: (val) {
                  setState(
                    () => userName = "@${val.trim()}",
                  );
                },
                txt: khandleTxt,
              ),

              // StrokeButtonField(
              //   onChangedProperty: (val) {
              //     setState(
              //       () => phone = val.trim(),
              //     );
              //   },
              //   txt: kNumberTxt,
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: BiggerButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print(email);
                      print(password);
                      print(legalName);
                      print(userName);

                      dynamic result = await AuthService().registerFirebaseUser(
                          email, password, legalName, userName);
                      if (result == null) {
                        setState(() => error = 'error, could not sign in user');
                      } else {
                        setState(() {
                          Navigator.pushNamed(
                            context,
                            '/log',
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
                txt: 'Already have an account?',
                routeName: '/log',
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
