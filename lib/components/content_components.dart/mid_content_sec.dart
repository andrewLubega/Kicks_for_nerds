import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/content_components.dart/description.dart';
import 'package:kicks_for_nerds/components/content_components.dart/upper_content_sec.dart';

class MidContentSec extends StatelessWidget {
  const MidContentSec({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shoe Name",
                  style: TextStyle(
                    fontFamily: 'comfortaa',
                    fontSize: kFontSize18,
                    fontWeight: kBoldTxt,
                  ),
                ),
              ],
            ),
            Divider(),
            DescriptionBox(),
          ],
        ),
      ],
    );
  }
}
