import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_block.dart';
import 'package:kicks_for_nerds/models/product.dart';
import 'package:kicks_for_nerds/services/database.dart';

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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: Container(),
          );
        } else if (snapshot.hasData) {
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
                  Product product = snapshot.data[index];

                  return PostBlock(
                    product: product,
                  );
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
  }
}
