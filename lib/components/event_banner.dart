import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

import 'reusable_card.dart';

class EventBanner extends StatelessWidget {
  const EventBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        0,
        36,
        0,
        0,
      ),
      height: 120,
      child: ListView(
        primary: false,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: ReusableCard(
              height: 120,
              width: 327,
              baseColour: kBaseWidgetColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: ReusableCard(
              height: 120,
              width: 327,
              baseColour: kBaseWidgetColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: ReusableCard(
              height: 120,
              width: 327,
              baseColour: kBaseWidgetColor,
            ),
          ),
        ],
      ),
    );
  }
}
