import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/profile_tag.dart';

class UpperContentSec extends StatelessWidget {
  const UpperContentSec({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
            color: kBaseWidgetColor,
            borderRadius: BorderRadius.circular(
              kRadiusNumber,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            52,
            24,
            0,
          ),
          child: GestureDetector(
            child: ProfileTag(),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ),
      ],
    );
  }
}
