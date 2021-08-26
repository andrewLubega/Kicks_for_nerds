import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';
import 'package:kicks_for_nerds/screens/profile_page.dart';
import 'package:kicks_for_nerds/services/database.dart';

class HandlePage extends StatefulWidget {
  @override
  _HandlePageState createState() => _HandlePageState();
}

class _HandlePageState extends State<HandlePage> {
  String handleValue = '';

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
                onChangedProperty: (val) => handleValue = val,
                hiddenPass: false,
                txt: 'Handle',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: BiggerButton(
                  onPressed: () {
                    DataBase().setHandle(handleValue);
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
