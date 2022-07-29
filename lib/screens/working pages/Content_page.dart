import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/nav_bar.dart';

class PostContentPage extends StatefulWidget {
  const PostContentPage({Key key}) : super(key: key);

  @override
  State<PostContentPage> createState() => _PostContentPageState();
}

class _PostContentPageState extends State<PostContentPage> {
  OverlayEntry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    color: kBaseWidgetColor,
                    borderRadius: BorderRadius.circular(
                      kRadiusNumber,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User",
                            style: TextStyle(
                              fontFamily: 'comfortaa',
                              fontSize: kFontSize18,
                              fontWeight: kBoldTxt,
                            ),
                          ),
                          Divider(),
                          Text("Description"),
                        ],
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

  void showOverlay() {
    entry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        right: 20,
        child: NavBar(),
      ),
    );

    final overlay = Overlay.of(context);
    overlay.insert(entry);
  }
}
