import 'package:flutter/material.dart';

import 'story_frame.dart';

class Stories extends StatelessWidget {
  const Stories({
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
      height: 72,
      child: SizedBox(
        height: 72,
        child: ListView(
          primary: false,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 24,
            ),
            StoryFrame(),
            StoryFrame(),
            StoryFrame(),
            StoryFrame(),
            StoryFrame(),
          ],
        ),
      ),
    );
  }
}
