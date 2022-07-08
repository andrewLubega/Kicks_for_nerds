import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';
import 'package:kicks_for_nerds/screens/profile_page.dart';
import 'package:kicks_for_nerds/services/database.dart';

class BioPage extends StatefulWidget {
  const BioPage({Key key}) : super(key: key);

  @override
  State<BioPage> createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  String bioValue = '';

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
                onChangedProperty: (val) => bioValue = val,
                hiddenPass: false,
                txt: 'Bio',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: BiggerButton(
                  onPressed: () {
                    DataBase().setBio(bioValue);
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                    );
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
