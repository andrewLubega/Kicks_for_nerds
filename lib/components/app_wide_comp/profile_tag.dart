import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class ProfileTag extends StatefulWidget {
  const ProfileTag({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileTagState createState() => _ProfileTagState();
}

class _ProfileTagState extends State<ProfileTag> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          decoration: BoxDecoration(
            color: Color(
              0x75000000,
            ),
            borderRadius: BorderRadius.circular(
              24,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                7,
                20,
                7,
              ),
              child: Text(
                "@UserName",
                style: TextStyle(
                  color: kDarkModefont,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
