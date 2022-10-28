import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/nav_bar.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/profile_tag.dart';
import 'package:kicks_for_nerds/components/content_components.dart/description.dart';
import 'package:kicks_for_nerds/components/content_components.dart/mid_content_sec.dart';
import 'package:kicks_for_nerds/components/content_components.dart/upper_content_sec.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';

import '../../models/product.dart';

class PostContentPage extends StatefulWidget {
  Product? product;

  PostContentPage(this.product);

  @override
  State<PostContentPage> createState() => _PostContentPageState();
}

class _PostContentPageState extends State<PostContentPage> {
  OverlayEntry? entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                UpperContentSec(product: widget.product),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    12,
                    24,
                    24,
                  ),
                  child: Column(
                    children: [
                      MidContentSec(widget.product),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: MyCard(
                          width: double.infinity,
                          height: 200,
                          baseColour: kBaseWidgetColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }

  // void showOverlay() {
  //   entry = OverlayEntry(
  //     builder: (context) => Positioned(
  //       bottom: 50,
  //       right: 20,
  //       child: NavBar(),
  //     ),
  //   );

  //   final overlay = Overlay.of(context);
  //   overlay.insert(entry);
  // }
}
