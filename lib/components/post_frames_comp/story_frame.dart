import 'dart:io';

import 'package:flutter/material.dart';

import 'package:kicks_for_nerds/assets/constants.dart';

class StoryFrame extends StatefulWidget {
  final storyImage;
  final size;
  StoryFrame({this.storyImage, this.size = 50.0});

  @override
  State<StoryFrame> createState() => _StoryFrameState();
}

class _StoryFrameState extends State<StoryFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0.0,
              1.5,
            ), //(x,y)
            blurRadius: 3.0,
            spreadRadius: 2.0,
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            widget.storyImage,
          ),
          // image: NetworkImage(
          //   widget.storyImage,
          // ),
        ),
      ),
    );
  }
}
