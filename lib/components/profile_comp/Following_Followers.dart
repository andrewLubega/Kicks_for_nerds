import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class FollowCount extends StatefulWidget {
  const FollowCount({Key? key, required this.titleCount, required this.title})
      : super(key: key);

  final int titleCount;
  final String title;

  @override
  _FollowCountState createState() => _FollowCountState();
}

class _FollowCountState extends State<FollowCount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.titleCount.toString(),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: kFontSize14,
            fontWeight: kBoldTxt,
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: kFontSize12,
            fontWeight: kRegularTxt,
            color: Color(
              0xFF828282,
            ),
          ),
        ),
      ],
    );
  }
}
