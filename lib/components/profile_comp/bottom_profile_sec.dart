import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_block.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_card.dart';
import 'package:kicks_for_nerds/models/product.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/loading_page.dart';
import 'package:kicks_for_nerds/services/database.dart';
import 'package:provider/provider.dart';

class BottomProfileSec extends StatefulWidget {
  const BottomProfileSec({Key? key}) : super(key: key);

  @override
  State<BottomProfileSec> createState() => _BottomProfileSecState();
}

class _BottomProfileSecState extends State<BottomProfileSec> {
  @override
  Widget build(BuildContext context) {
    // TODO added null check on object streamer
    return FutureBuilder<List<Product>>(
      future: DataBase().getProduct(),
      builder: (context, AsyncSnapshot snapshot) {
        // List productList = snapshot.data;

        // print(snapshot.data);

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: LoadingPage(),
          );

          // return SliverPadding(
          //   padding: EdgeInsets.fromLTRB(
          //     24,
          //     12,
          //     24,
          //     12,
          //   ),
          //   sliver: SliverGrid(
          //     delegate: SliverChildBuilderDelegate(
          //       (BuildContext context, int index) {
          //         // Product product = snapshot.data[index];

          //         return LoadingPage();
          //       },
          //       childCount: 1,
          //     ),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 3,
          //       mainAxisSpacing: 12,
          //       crossAxisSpacing: 12,
          //       childAspectRatio: 1,
          //     ),
          //   ),
          // );
        } else if (snapshot.hasData) {
          // List productList = snapshot.data;

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
                  // Product product = snapshot.data[index];

                  return PostBlock();
                },
                childCount: snapshot.data.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
            ),
          );
        }

        return Container();
      },
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
