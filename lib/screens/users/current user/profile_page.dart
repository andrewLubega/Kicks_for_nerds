import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/nav_bar.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';
import 'package:kicks_for_nerds/components/profile_comp/bottom_profile_sec.dart';
import 'package:kicks_for_nerds/components/profile_comp/mid_profile_sec.dart';
import 'package:kicks_for_nerds/components/profile_comp/other/other_mid_profile_sec.dart';
import 'package:kicks_for_nerds/components/profile_comp/upper_profile_sec.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                UpperProfileSec(),
                MidProfileSec(),
              ],
            ),
          ),
          BottomProfileSec(),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
