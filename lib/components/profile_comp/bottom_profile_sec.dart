import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_block.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_card.dart';

class BottomProfileSec extends StatefulWidget {
  const BottomProfileSec({Key key}) : super(key: key);

  @override
  State<BottomProfileSec> createState() => _BottomProfileSecState();
}

class _BottomProfileSecState extends State<BottomProfileSec> {
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
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return PostBlock();
          },
          childCount: 13,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
        ),
      ),
    );
    // return GridView.builder(
    //   physics: NeverScrollableScrollPhysics(),
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemCount: 3,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 12,
    //     mainAxisSpacing: 12,
    //   ),
    //   itemBuilder: (context, index) {
    //     const PostBlock();
    //   },
    // );

    // return CustomScrollView(()
    //   shrinkWrap: true,
    //   slivers: [
    //     GridView.count(
    //       shrinkWrap: true,
    //       padding: EdgeInsets.zero,
    //       scrollDirection: Axis.vertical,
    //       addAutomaticKeepAlives: true,
    //       addRepaintBoundaries: true,
    //       physics: BouncingScrollPhysics(
    //         parent: NeverScrollableScrollPhysics(),
    //       ),
    //       crossAxisCount: 9,
    //       crossAxisSpacing: 12,
    //       mainAxisSpacing: 12,
    //       children: List.generate(
    //         3,
    //         (index) => PostBlock(),
    //       ),
    //     ),
    //   ],
    // );
    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(
    //     24,
    //     12,
    //     24,
    //     24,
    //   ),
    //   child: GridView.count(
    //     shrinkWrap: true,
    //     padding: EdgeInsets.zero,
    //     scrollDirection: Axis.vertical,
    //     addAutomaticKeepAlives: true,
    //     addRepaintBoundaries: true,
    //     physics: BouncingScrollPhysics(
    //       parent: NeverScrollableScrollPhysics(),
    //     ),
    //     crossAxisCount: 9,
    //     crossAxisSpacing: 12,
    //     mainAxisSpacing: 12,
    //     children: List.generate(
    //       3,
    //       (index) => PostBlock(),
    //     ),
    //   ),
    // );
  }
}
