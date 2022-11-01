import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/components/buttons_comp/profile_buttons.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/story_frame.dart';
import 'package:kicks_for_nerds/components/profile_comp/mid_profile_icon_nav.dart';

class MidProfileSec extends StatefulWidget {
  const MidProfileSec({Key? key}) : super(key: key);

  @override
  State<MidProfileSec> createState() => _MidProfileSecState();
}

class _MidProfileSecState extends State<MidProfileSec> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Container(
        // TODO change height back to 97 later
        height: 47.5,
        width: double.infinity,
        // color: Colors.grey,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SmallButton(title: "Follow"),
            //     SmallButton(title: "Message"),
            //   ],
            // ),
            //TODO uncomment later.
            // Container(
            //   width: double.infinity,
            //   height: 70,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, int index) => StoryFrame(
            //       storyImage: 'images/ttc.png',
            //     ),
            //     separatorBuilder: (context, int index) => SizedBox(
            //       height: 40,
            //       width: 24,
            //     ),
            //     itemCount: 20,
            //   ),
            // ),
            MidProfileIconNav(),
          ],
        ),
      ),
    );
  }
}
