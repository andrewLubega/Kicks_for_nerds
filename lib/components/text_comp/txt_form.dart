import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class TxtForm extends StatelessWidget {
  const TxtForm({Key key, this.txt}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(
          24,
          30,
          24,
          0,
        ),
        hintText: txt,
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: kFontSize12,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
