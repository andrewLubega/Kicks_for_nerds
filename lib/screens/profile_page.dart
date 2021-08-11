import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/components/Following_Followers.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';
import 'package:kicks_for_nerds/components/post_block.dart';
import 'package:kicks_for_nerds/components/story_frame.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
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
                  // color: kBaseWidgetColor,
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
                              width: 86,
                              decoration: BoxDecoration(
                                color: Color(
                                  0x75000000,
                                ),
                                borderRadius: BorderRadius.circular(
                                  24,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '@user',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Roboto',
                                  ),
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
                  radius: 62.5,
                  backgroundImage: AssetImage(
                    'images/ttc.png',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(48, 215, 48, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FollowerFollowingCount(
                      titleCount: '0k',
                      title: 'Followers',
                    ),
                    FollowerFollowingCount(
                      titleCount: '0k',
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
                        padding: const EdgeInsets.fromLTRB(105, 39, 104, 0),
                        child: Wrap(
                          children: <Widget>[
                            Text(
                              'User',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: kFontSize18,
                                  fontWeight: kBoldTxt),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 12, 60, 0),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Text(
                              'An aspiring young black entrepenuer, turning my shoe game into reality.',
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
                        StoryFrame(),
                        StoryFrame(),
                        StoryFrame(),
                        StoryFrame(),
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
                              '15',
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
                        Image.asset(
                          'images/tagged_icon.png',
                          height: kIconImageHeight,
                        ),
                        Image.asset(
                          'images/bag_icon.png',
                          height: kIconImageHeight,
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: GridView.count(
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        children: List.generate(
                          12,
                          (index) {
                            return PostBlock();
                          },
                        ),
                      ),
                    ),
                  ),
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

