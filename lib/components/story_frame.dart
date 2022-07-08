import 'dart:io';

import 'package:flutter/material.dart';

import 'package:kicks_for_nerds/assets/constants.dart';

class StoryFrame extends StatefulWidget {
  final storyImage;

  StoryFrame({this.storyImage});

  @override
  State<StoryFrame> createState() => _StoryFrameState();
}

class _StoryFrameState extends State<StoryFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        // color: Colors.black,
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            widget.storyImage,
          ),
        ),
      ),
    );
  }
}

// class StoryFrame extends StatelessWidget {
//   String storyImage;
//   StoryFrame(this.storyImage);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(
//         0,
//         0,
//         24,
//         0,
//       ),
//       child: Container(
//         height: 10,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(
//             100,
//           ),
//         ),
//       ),
//       // child: CircleAvatar(
//       //   backgroundColor: kBaseWidgetColor,
//       // ),
//     );
//   }
// }

// class AddStory extends StatefulWidget {
//   const AddStory({ Key key }) : super(key: key);

//   @override
//   State<AddStory> createState() => _AddStoryState();
// }

// class _AddStoryState extends State<AddStory> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      
//     );
//   }
// }