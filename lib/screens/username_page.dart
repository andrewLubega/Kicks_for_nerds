import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';
import 'package:kicks_for_nerds/screens/profile_page.dart';
import 'package:kicks_for_nerds/services/database.dart';

class UserNamePage extends StatefulWidget {
  @override
  _UserNamePageState createState() => _UserNamePageState();
}

class _UserNamePageState extends State<UserNamePage> {
  String userNameValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBaseWidgetColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 72, 0, 250),
            child: CustomBackButton(),
          ),
          Column(
            children: <Widget>[
              StrokeButtonField(
                onChangedProperty: (val) => userNameValue = val,
                hiddenPass: false,
                txt: 'User Name',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: BiggerButton(
                  onPressed: () {
                    DataBase().setUserName(userNameValue);
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                    });
                  },
                  title: 'Set',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
