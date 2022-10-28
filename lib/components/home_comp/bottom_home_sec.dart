import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_block.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_card.dart';

import '../../models/product.dart';
import '../../screens/finished pages/loading_page.dart';
import '../../services/database.dart';

class BottomHomeSec extends StatefulWidget {
  @override
  _BottomHomeSecState createState() => _BottomHomeSecState();
}

class _BottomHomeSecState extends State<BottomHomeSec> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: DataBase().getGlobalProducts(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(
            child: LoadingPage(),
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

                  return PostBlock(product: product,);
                },
                childCount: snapshot.data.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
