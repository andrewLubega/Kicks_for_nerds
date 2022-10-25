import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/enums.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/nav_bar.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/search_bar.dart';
import 'package:kicks_for_nerds/components/buttons_comp/stroke_button.dart';
import 'package:kicks_for_nerds/components/dms_comp/dm_container.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/post_block.dart';
import 'package:kicks_for_nerds/components/profile_search_card.dart';
import 'package:kicks_for_nerds/components/text_comp/toggle_bold.dart';
import 'package:kicks_for_nerds/components/text_comp/txt_fonts.dart';

class Dmspage extends StatefulWidget {
  const Dmspage({Key? key}) : super(key: key);

  @override
  _DmspageState createState() => _DmspageState();
}

class _DmspageState extends State<Dmspage> {
  bool hasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    font fontType;
    return Scaffold(
      backgroundColor: kBGClr,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 72),
                  child: SearchBar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: 600,
                    child: DefaultTabController(
                      length: 2,
                      child: Scaffold(
                        appBar: AppBar(
                          toolbarHeight: 20,
                          elevation: 0,
                          backgroundColor: kBGClr,
                          title: TabBar(
                            isScrollable: false,
                            // indicatorWeight: 1.0,
                            // indicatorColor: Colors.black,
                            // onTap: (value) {},
                            labelColor: kLightModeFont,
                            tabs: [
                              Tab(
                                text: "Direct",
                              ),
                              Tab(
                                text: "General",
                              ),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          // physics: NeverScrollableScrollPhysics(
                          //   parent: ScrollPhysics(
                          //     parent: BouncingScrollPhysics(
                          //       parent: AlwaysScrollableScrollPhysics(),
                          //     ),
                          //   ),
                          // ),
                          children: [
                            ListView.separated(
                              padding: EdgeInsets.all(8.0),
                              itemBuilder: (context, index) {
                                return DmContainers();
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: 3,
                            ),
                            ListView.separated(
                              padding: EdgeInsets.all(8.0),
                              itemBuilder: (context, index) {
                                return DmContainers();
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}


//  DefaultTabController(
//             length: 2,
//             child: TabBarView(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Container(
//                     width: 40,
//                     height: 20,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 30,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: Text("this is a great movie"),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Container(
//                     width: 40,
//                     height: 20,
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 30,
//                           width: 30,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.black,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 20),
//                           child: Text(
//                             "everybody hates a critic",
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
