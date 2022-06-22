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