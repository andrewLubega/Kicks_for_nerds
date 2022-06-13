import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/assets/my_stream_builder.dart';
import 'package:kicks_for_nerds/components/Following_Followers.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';
import 'package:kicks_for_nerds/components/post_block.dart';
import 'package:kicks_for_nerds/components/post_card.dart';
import 'package:kicks_for_nerds/components/story_frame.dart';
import 'package:kicks_for_nerds/models/posts.dart';
import 'package:kicks_for_nerds/services/auth.dart';
import 'package:kicks_for_nerds/services/database.dart';

import 'loading_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var posts;
  final connection = FirebaseDatabase.instance.reference();

//TODO change back to empty variable
  int pL;
//here
  String userUid = '';
  userRetrieval() async {
    String user = await AuthService(FirebaseAuth.instance).currentUser();
    setState(() {
      userUid = user;
    });
  }

  postLength() async {
    int pLength = await DataBase().getPostLength().then(
          (value) => value,
        );
    setState(() {
      pL = pLength;
    });
  }

  @override
  void initState() {
    super.initState();
    postLength();
    userRetrieval();
  }

//here

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 203,
                width: 375,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      'images/aot.png',
                    ),
                  ),
                  color: kBaseWidgetColor,
                  borderRadius: BorderRadius.circular(kRadiusNumber),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        24,
                        52,
                        24,
                        0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onDoubleTap: () {
                              Navigator.pushNamed(context, '/log');
                            },
                            child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(
                                  0x75000000,
                                ),
                                borderRadius: BorderRadius.circular(
                                  24,
                                ),
                              ),
                              child: Center(
                                  // child: MyStreamBuilder(
                                  //   fontSize: 10.0,
                                  //   clrs: Colors.white,
                                  //   userUid: userUid,
                                  //   location: 'users',
                                  //   valueKey: 'handle',
                                  // ),
                                  ),
                            ),
                          ),
                          // Image.asset(
                          //   'images/settings_icon.png',
                          //   height: 20,
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/log');
                            },
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(context, '/set');
                                });
                              },
                              child: Image.asset(
                                'images/settings_icon.png',
                                height: 29,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 136,
                left: 121,
                child: CircleAvatar(
                  radius: 66.5,
                  backgroundColor: Colors.black,
                ),
              ),
              Positioned(
                top: 138,
                left: 123,
                child: CircleAvatar(
                  radius: 64.5,
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                top: 140,
                left: 125,
                child: CircleAvatar(
                  radius: 62.5, backgroundColor: kBaseWidgetColor,
                  // backgroundImage: AssetImage(
                  //   'images/ttc.png',
                  // ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 215, 48, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FollowerFollowingCount(
                      titleCount: '0',
                      title: 'Followers',
                    ),
                    FollowerFollowingCount(
                      titleCount: '0',
                      title: 'Following',
                    )
                  ],
                ),
              ),
            ],
            clipBehavior: Clip.none,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //       colors: lProfileGrad,
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter),
              // ),
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 39, 0, 0),
                        // child: MyStreamBuilder(
                        //   fontWeight: kBoldTxt,
                        //   fontSize: kFontSize18,
                        //   valueKey: 'fullName',
                        //   location: 'users',
                        //   userUid: userUid,
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 12, 60, 0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Text(
                              'Cupidatat culpa nisi laboris nulla enim deserunt ex occaecat consectetur laborum mollit mollit exercitation.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: kFontSize12,
                                fontWeight: kLightTxt,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                      0,
                      18,
                      0,
                      0,
                    ),
                    height: 65,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SizedBox(
                          width: 24,
                        ),
                        StoryFrame(),
                        // StoryFrame(),
                        // StoryFrame(),
                        // StoryFrame(),
                        // StoryFrame(),
                      ],
                    ),
                  ),
                  // post-count, tagged, store
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 17, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "stripphy",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: kFontSize14,
                                fontWeight: kBoldTxt,
                              ),
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: Colors.pinkAccent[400],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(
                                context,
                                '/tag',
                              );
                            });
                          },
                          child: Image.asset(
                            'images/tagged_icon.png',
                            height: kIconImageHeight,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.pushNamed(
                                context,
                                '/store',
                              );
                            });
                          },
                          child: Image.asset(
                            'images/bag_icon.png',
                            height: kIconImageHeight,
                          ),
                        ),
                        SizedBox(
                          width: 149,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  CircleAvatar(
                                    radius: 2,
                                    backgroundColor: Colors.black,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Posts
                  // StreamBuilder(
                  //   stream: connection
                  //       // .child('users')
                  //       // .child(userUid)
                  //       .child('posts')
                  //       .child(userUid)
                  //       .onValue,
                  //   builder: (context, AsyncSnapshot snapshot) {
                  //     if (snapshot.data == null) {
                  //       snapshot.connectionState == ConnectionState.waiting
                  //           ? LoadingPage()
                  //           : Container();
                  //     }
                  //     final List<Post> postList = [];
                  //     final Map<dynamic, dynamic> postMap =
                  //         snapshot.data.snapshot.value;
                  //     //print(postMap);
                  //     // postMap.forEach(
                  //     //   (key, value) {
                  //     //     print(key);
                  //     //     print(value);

                  //     //     Post post = Post(
                  //     //       imageUrl: value['imageUrl'],
                  //     //       title: value['title'],
                  //     //       text: value['text'],
                  //     //     );

                  //     //     postList.add(post);
                  //     //     print(postList.length);
                  //     //     print(post);
                  //     //   },
                  //     // );
                  //     print("result before calc");
                  //     print("result below");
                  //     print(postList);
                  //     print("result above");
                  //     return Expanded(
                  //       child: Padding(
                  //         padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  //         child: GridView.count(
                  //           crossAxisCount: 3,
                  //           crossAxisSpacing: 12,
                  //           mainAxisSpacing: 11,
                  //           children: List.generate(
                  //             postList.length,
                  //             (index) {
                  //               print(
                  //                 postList[index].imageUrl,
                  //               );
                  //               return PostCard(
                  //                 width: 158,
                  //                 height: 190,
                  //                 baseColour: kBaseWidgetColor,
                  //                 image: postList[index].imageUrl,
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  //     child: GridView.count(
                  //       crossAxisSpacing: 12,
                  //       mainAxisSpacing: 12,
                  //       physics: NeverScrollableScrollPhysics(),
                  //       shrinkWrap: true,
                  //       crossAxisCount: 3,
                  //       children: List.generate(
                  //         1,
                  //         (index) {
                  //           return PostBlock();
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

// Column(
//         children: [
//           Expanded(
//             child: LayoutBuilder(
//               builder:
//                   (BuildContext context, BoxConstraints viewportConstraints) {
//                 return SingleChildScrollView(
//                     child: ConstrainedBox(
//                   constraints:
//                       BoxConstraints(minHeight: viewportConstraints.minHeight),
//                   child:
