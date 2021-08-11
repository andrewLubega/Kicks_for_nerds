import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class PostBlock extends StatelessWidget {
  const PostBlock({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 101,
      decoration: BoxDecoration(
        color: kBaseWidgetColor,
        borderRadius: BorderRadius.circular(
          kCircleRadNumber,
        ),
      ),
    );
  }
}
