import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class FollowerFollowingCount extends StatefulWidget {
  const FollowerFollowingCount(
      {Key key, @required this.titleCount, @required this.title})
      : super(key: key);

  final String titleCount;
  final String title;

  @override
  _FollowerFollowingCountState createState() => _FollowerFollowingCountState();
}

class _FollowerFollowingCountState extends State<FollowerFollowingCount> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.titleCount,
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
