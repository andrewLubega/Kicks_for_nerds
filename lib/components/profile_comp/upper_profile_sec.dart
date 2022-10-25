import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/profile_tag.dart';
import 'package:kicks_for_nerds/components/profile_comp/Following_Followers.dart';

class UpperProfileSec extends StatefulWidget {
  const UpperProfileSec({Key? key}) : super(key: key);

  @override
  State<UpperProfileSec> createState() => _UpperProfileSecState();
}

class _UpperProfileSecState extends State<UpperProfileSec> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 203,
              decoration: BoxDecoration(
                color: kBaseWidgetColor,
                borderRadius: BorderRadius.circular(
                  24,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ProfileTag(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/set',
                    ),
                    child: Image.asset(
                      'images/settings_icon.png',
                      height: 29,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 140,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    Container(
                      height: kContainerCircRad,
                      width: kContainerCircRad,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        48,
                        50,
                        48,
                        0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FollowCount(
                            titleCount: 0,
                            title: "Followers",
                          ),
                          FollowCount(
                            titleCount: 0,
                            title: "Following",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18,
            ),
            child: Column(
              children: [
                Text(
                  "name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kLightModeFont,
                    fontFamily: kRoboto,
                    fontSize: kFontSize18,
                    fontWeight: kBoldTxt,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: Text(
                    "bio",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kLightModeFont,
                      fontFamily: kRoboto,
                      fontSize: kFontSize12,
                      fontWeight: kLightTxt,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
