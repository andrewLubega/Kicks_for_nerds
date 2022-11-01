import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/event_banner.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/nav_bar.dart';
import 'package:kicks_for_nerds/components/home_comp/bottom_home_sec.dart';
import 'package:kicks_for_nerds/components/home_comp/mid_home_sec.dart';
import 'package:kicks_for_nerds/components/home_comp/upper_home_sec.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_block.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_card.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/stories/stories.dart';

import 'package:kicks_for_nerds/services/database.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // UpperHomeSec(),
                // MidHomeSec(),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          BottomHomeSec(),
        ],
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
          ),
          child: NavBar()),
    );
  }
}
