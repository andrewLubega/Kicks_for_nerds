import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/stories/my_story.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/stories/progress_bar.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/stories/story_bars.dart';

class ActiveStoryPage extends StatefulWidget {
  const ActiveStoryPage({Key key}) : super(key: key);

  @override
  State<ActiveStoryPage> createState() => _ActiveStoryPageState();
}

class _ActiveStoryPageState extends State<ActiveStoryPage> {
  int currrentStoryIndex = 0;

  final List<MyStory> myStories = [
    MyStory(
      Colors.blue,
    ),
    MyStory(
      Colors.red,
    ),
    MyStory(
      Colors.yellow,
    ),
  ];

  List<double> percentWatched = [];

  @override
  Void initState() {
    super.initState();

    myStories.forEach(
      (story) {
        percentWatched.add(0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // myStories[currrentStoryIndex],
          MyStoryBars(
            percentWatched: percentWatched, storyNum: null,
          ),
        ],
      ),
    );
  }
}
