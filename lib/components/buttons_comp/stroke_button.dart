import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class StrokeButtonField extends StatelessWidget {
  const StrokeButtonField(
      {Key key, this.txt, this.onChangedProperty, this.hiddenPass})
      : super(key: key);

  final String txt;
  final onChangedProperty;
  final hiddenPass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 10,
      ),
      child: Container(
        child: TextField(
          obscureText: hiddenPass,
          onChanged: onChangedProperty,
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
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            24.0,
          ),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
