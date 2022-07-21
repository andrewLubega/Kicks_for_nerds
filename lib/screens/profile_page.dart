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
  PageController _pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );

//TODO change back to empty variable
  int pL;
//here
  String userUid = '';
  userRetrieval() async {
    String user = await AuthService().currentUser();
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
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

//here

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kBGClr,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 203,
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
                                    child: StreamBuilder(
                                      stream: connection
                                          .child('users')
                                          .child(userUid)
                                          .onValue,
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          final Map<dynamic, dynamic> userMap =
                                              snapshot.data.snapshot.value;

                                          return Text(
                                            "@${userMap['handle']}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          );
                                        }

                                        snapshot.connectionState ==
                                                ConnectionState.waiting
                                            ? LoadingPage()
                                            : Text(
                                                "data not here",
                                              );
                                      },
                                    ),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 130),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            CircleAvatar(
                              radius: 66.5,
                              backgroundColor: Colors.black,
                            ),
                            CircleAvatar(
                              radius: 64.5,
                              backgroundColor: Colors.white,
                            ),
                            CircleAvatar(
                              radius: 62.5,
                              backgroundColor: kBaseWidgetColor,
                              backgroundImage: AssetImage(
                                'images/ttc.png',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Positioned(
                  //   // top: 136,
                  //   // left: 121,
                  //   child: CircleAvatar(
                  //     radius: 66.5,
                  //     backgroundColor: Colors.black,
                  //   ),
                  // ),
                  // Positioned(
                  //   // top: 138,
                  //   // left: 123,
                  //   child: CircleAvatar(
                  //     radius: 64.5,
                  //     backgroundColor: Colors.white,
                  //   ),
                  // ),
                  // Positioned(
                  //   // top: 140,
                  //   // left: 125,
                  //   child: CircleAvatar(
                  //     radius: 62.5,
                  //     backgroundColor: kBaseWidgetColor,
                  //     backgroundImage: AssetImage(
                  //       'images/ttc.png',
                  //     ),
                  //   ),
                  // ),
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
                            child: StreamBuilder(
                              stream: connection
                                  .child('users')
                                  .child(userUid)
                                  .onValue,
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  final Map<dynamic, dynamic> userMap =
                                      snapshot.data.snapshot.value;

                                  return Text(
                                    "${userMap['fullName']}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontSize: kFontSize14,
                                      fontWeight: kBoldTxt,
                                    ),
                                  );
                                }

                                snapshot.connectionState ==
                                        ConnectionState.waiting
                                    ? LoadingPage()
                                    : Text("data not here");
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(60, 12, 60, 0),
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                StreamBuilder(
                                  stream: connection
                                      .child('users')
                                      .child(userUid)
                                      .onValue,
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? LoadingPage()
                                          : Text("data not here");
                                    }
                                    final Map<dynamic, dynamic> userMap =
                                        snapshot.data.snapshot.value;
                                    // 'Cupidatat culpa nisi laboris nulla enim deserunt ex occaecat consectetur laborum mollit mollit exercitation.',
                                    return Text(
                                      "${userMap['bio']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: kFontSize12,
                                        fontWeight: kLightTxt,
                                      ),
                                    );
                                  },
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
                        width: 900,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(
                              width: 24,
                            ),
                            StreamBuilder(
                              stream: connection
                                  .child('users')
                                  .child(userUid)
                                  .child('stories')
                                  .onValue,
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  final Map<dynamic, dynamic> storyMap =
                                      snapshot.data.snapshot.value;
                                  List<Story> storyList = [];

                                  storyMap.forEach(
                                    (key, value) {
                                      Story story = Story(
                                        imageUrl: value['imageUrl'],
                                      );

                                      storyList.add(story);
                                      // print(storyList.length);
                                    },
                                  );

                                  // return StoryFrame(
                                  //   storyImage: storyList[0].imageUrl,
                                  // );

                                  return Container(
                                    height: 800,
                                    width: 500,
                                    child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: storyList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          StoryFrame(
                                        storyImage: storyList[index].imageUrl,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            // StoryFrame(image:""),
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
                                SizedBox(
                                  height: 24,
                                  child: StreamBuilder(
                                    stream: connection
                                        .child('users')
                                        .child(userUid)
                                        .child('posts')
                                        .onValue,
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        final List<Post> postList = [];
                                        final Map<dynamic, dynamic> postMap =
                                            snapshot.data.snapshot.value;

                                        postMap.forEach(
                                          (key, value) {
                                            Post post = Post(
                                              imageUrl: value['imageUrl'],
                                              title: value['value'],
                                              text: value['text'],
                                            );

                                            postList.add(post);
                                            print(postList.length);
                                          },
                                        );
                                        return Text(
                                          postList.length.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: kFontSize14,
                                            fontWeight: kBoldTxt,
                                          ),
                                        );
                                      }

                                      snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? LoadingPage()
                                          : Text(
                                            
                                              "0",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: kFontSize14,
                                                fontWeight: kBoldTxt,
                                              ),
                                            );
                                    },
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
                      StreamBuilder(
                        stream: connection
                            .child('users')
                            .child(userUid)
                            .child('posts')
                            .onValue,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            final List<Post> postList = [];
                            final Map<dynamic, dynamic> postMap =
                                snapshot.data.snapshot.value;

                            postMap.forEach(
                              (key, value) {
                                Post post = Post(
                                  imageUrl: value['imageUrl'],
                                  title: value['value'],
                                  text: value['text'],
                                );

                                postList.add(post);
                                print(postList.length);
                              },
                            );
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                                child: GridView.count(
                                  physics: BouncingScrollPhysics(
                                    parent: NeverScrollableScrollPhysics(),
                                  ),
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 11,
                                  children: List.generate(
                                    postList.length,
                                    (index) {
                                      return PostCard(
                                        height: 158,
                                        width: 190,
                                        baseColour: kBaseWidgetColor,
                                        image: postList[index].imageUrl,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          }
                          snapshot.connectionState == ConnectionState.waiting
                              ? LoadingPage()
                              : Container();
                        },
                      )

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
                      //     print(postMap);
                      //     postMap.forEach(
                      //       (key, value) {
                      //         print(key);
                      //         print(value);

                      //         Post post = Post(
                      //           imageUrl: value['imageUrl'],
                      //           title: value['title'],
                      //           text: value['text'],
                      //         );

                      //         postList.add(post);
                      //         print(postList.length);
                      //         print(post);
                      //       },
                      //     );

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
                      //               print("stream post");
                      //               print(index);
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
        ),
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