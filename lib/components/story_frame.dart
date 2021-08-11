import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class StoryFrame extends StatelessWidget {
  const StoryFrame({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        0,
        0,
        24,
        0,
      ),
      child: CircleAvatar(
        radius: 36,
        backgroundColor: kBaseWidgetColor,
      ),
    );
  }
}
