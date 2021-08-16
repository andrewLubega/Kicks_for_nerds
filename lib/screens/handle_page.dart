import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';

class HandlePage extends StatelessWidget {
  const HandlePage({Key key}) : super(key: key);

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
                hiddenPass: false,
                txt: 'Handle',
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                ),
                child: BiggerButton(
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
