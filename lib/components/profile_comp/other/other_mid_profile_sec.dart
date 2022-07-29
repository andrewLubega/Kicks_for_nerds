import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/components/buttons_comp/profile_buttons.dart';
import 'package:kicks_for_nerds/components/buttons_comp/small_button.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/story_frame.dart';
import 'package:kicks_for_nerds/components/profile_comp/mid_profile_icon_nav.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/message_page.dart';

class OtherMidProfileSec extends StatefulWidget {
  @override
  State<OtherMidProfileSec> createState() => _OtherMidProfileSecState();
}

class _OtherMidProfileSecState extends State<OtherMidProfileSec> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FollowButton(
              title: "Follow",
              buttonHeight: 40.0,
              buttonWidth: 96.8,
            ),
            SizedBox(
              width: 25,
              height: 10,
            ),
            MessageButton(
              title: "Message",
              buttonHeight: 40.0,
              buttonWidth: 96.8,
              routeName: '/msg',

            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Container(
            height: 97,
            width: double.infinity,
            // color: Colors.grey,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, int index) => StoryFrame(
                      storyImage: 'images/ttc.png',
                    ),
                    separatorBuilder: (context, int index) => SizedBox(
                      height: 40,
                      width: 24,
                    ),
                    itemCount: 20,
                  ),
                ),
                MidProfileIconNav(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
