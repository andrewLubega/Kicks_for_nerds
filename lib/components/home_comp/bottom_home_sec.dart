import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_block.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_card.dart';

class BottomHomeSec extends StatefulWidget {
  const BottomHomeSec({
    Key? key,
  }) : super(key: key);

  @override
  _BottomHomeSecState createState() => _BottomHomeSecState();
}

class _BottomHomeSecState extends State<BottomHomeSec> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(
        24,
        12,
        24,
        12,
      ),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return PostBlock();
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
      ),
    );
  }
}
