import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/event_banner.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';
import 'package:kicks_for_nerds/components/post_card.dart';
import 'package:kicks_for_nerds/components/reusable_card.dart';
import 'package:kicks_for_nerds/components/stories.dart';
import 'package:kicks_for_nerds/components/story_frame.dart';
import 'package:kicks_for_nerds/screens/loading_page.dart';
import 'package:kicks_for_nerds/services/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              24,
              72,
              24,
              0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/cam');
                    });
                  },
                  child: Image.asset(
                    'images/cam_arrow.png',
                    height: kIconImageHeight,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/shop');
                    });
                  },
                  child: Image.asset(
                    'images/shop_arrow.png',
                    height: kIconImageHeight,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 500,
              width: double.infinity,
              color: Colors.orange,
              child: DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    toolbarHeight: 20,
                    backgroundColor: kBGClr,
                    title: TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: "Info",
                        ),
                        Tab(
                          text: "Critics",
                        )
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Container(
                          width: 40,
                          height: 20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("this is a great movie"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Container(
                          width: 40,
                          height: 20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  "everybody hates a critic",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // StreamBuilder(
          //     stream:
          //         FirebaseDatabase.instance.reference().child('posts').onValue,
          //     builder: (context, AsyncSnapshot snapshot) {
          //       if (snapshot.data == null) {
          //         snapshot.connectionState == ConnectionState.waiting
          //             ? LoadingPage()
          //             : Container();
          //       }
          //       posts = DataBase().getPostList(snapshot: snapshot);
          //       // print(posts);
          //       return Expanded(
          //         child: Padding(
          //           padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          //           child: GridView.count(
          //             crossAxisCount: 2,
          //             crossAxisSpacing: 12,
          //             mainAxisSpacing: 11,
          //             children: List.generate(
          //               posts.length,
          //               (index) {
          //                 print(
          //                   posts[index].imageUrl,
          //                 );
          //                 return PostCard(
          //                   width: 158,
          //                   height: 190,
          //                   baseColour: kBaseWidgetColor,
          //                   image: posts[index].imageUrl,
          //                 );
          //               },
          //             ),
          //           ),
          //         ),
          //       );
          //     }),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}



// class HomePage extends StatefulWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBGClr,
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.fromLTRB(
//               24,
//               72,
//               24,
//               0,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {},
//                   child: Image.asset(
//                     'images/cam_arrow.png',
//                     height: kIconImageHeight,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Image.asset(
//                     'images/shop_arrow.png',
//                     height: kIconImageHeight,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Stories(),
//           EventBanner(),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
//               child: GridView.count(
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 11,
//                 children: List.generate(
//                   12,
//                   (index) {
//                     return ReusableCard(
//                       height: 190,
//                       width: 158,
//                       baseColour: kBaseWidgetColor,
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: NavBar(),
//     );
//   }
// }
