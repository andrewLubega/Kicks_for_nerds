import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class MyStory extends StatefulWidget {
  final Color color;
  MyStory(this.color);

  @override
  State<MyStory> createState() => _MyStoryState();
}

class _MyStoryState extends State<MyStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
    );
  }
}
