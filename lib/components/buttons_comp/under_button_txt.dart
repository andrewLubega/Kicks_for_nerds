import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class UnderButtonTxt extends StatelessWidget {
  UnderButtonTxt({
    @required this.txt,
    @required this.routeName,
  });

  final String txt;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 14.0, right: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                routeName,
              );
            },
            child: Text(
              txt,
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: kFontSize12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
