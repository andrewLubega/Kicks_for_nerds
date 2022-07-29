import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/stories/progress_bar.dart';

class MyStoryBars extends StatelessWidget {
  final percentWatched;
  final storyNum;

  MyStoryBars({@required this.percentWatched, @required this.storyNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 60, 8, 0),
      child: Row(
        children: [
          ListView.builder(
            itemCount: storyNum,
            itemBuilder: (context, index) {
              return Expanded(
                child: MyProgressBar(
                  percentWatched: percentWatched,
                ),
              );
            },
          ),
          // Expanded(
          //   child: MyProgressBar(
          //     percentWatched: percentWatched,
          //   ),
          // ),
          // Expanded(
          //   child: MyProgressBar(
          //     percentWatched: 0.2,
          //   ),
          // ),
          // Expanded(
          //   child: MyProgressBar(
          //     percentWatched: 0.2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
