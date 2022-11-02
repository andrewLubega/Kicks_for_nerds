import 'dart:io';

import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

import '../../services/database.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // var _profileImage;
  // final picker = ImagePicker();

  // Future getImageGallery() async {
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedImage != null) {
  //       _profileImage = File(pickedImage.path);
  //     } else {
  //       print('No Image Selected');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(
    //     kRadiusNumber,
    //   ),
    //   child: BottomNavigationBar(
    //     items: [
    //       BottomNavigationBarItem(
    //         label: "home",
    //         icon: ImageIcon(
    //           AssetImage(
    //             'images/home_icon.png',
    //           ),
    //         ),
    //       ),
    //       BottomNavigationBarItem(
    //         label: "home",
    //         icon: ImageIcon(
    //           AssetImage(
    //             'images/home_icon.png',
    //           ),
    //         ),
    //       ),
    //       BottomNavigationBarItem(
    //         label: "home",
    //         icon: ImageIcon(
    //           AssetImage(
    //             'images/home_icon.png',
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(kRadiusNumber),
        color: Colors.black,
        child: Container(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Image.asset(
                  'images/home_icon.png',
                  height: kNavIconImageHeight,
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(
              //       context,
              //       '/srch',
              //     );
              //   },
              //   child: Image.asset(
              //     'images/search_icon.png',
              //     height: kNavIconImageHeight,
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/posts',
                  );
                  print('success');
                  // getImageGallery();
                },
                child: Image.asset(
                  'images/post_icon.png',
                  height: kNavIconImageHeight,
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(
              //       context,
              //       '/dms',
              //     );
              //   },
              //   child: Image.asset(
              //     'images/dm_icon.png',
              //     height: kNavIconImageHeight,
              //   ),
              // ),

              Container(
                height: 20,
                width: 20,
                child: ClipOval(
                  child: FutureBuilder(
                    future: DataBase().getProfilePic(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/profile',
                            );
                          },
                          child: Image(
                            image: NetworkImage(
                              "https://mediastudies.ugis.berkeley.edu/wp-content/themes/sydney-pro-child/images/user-default.png",
                              scale: .5,
                            ),
                          ),
                        );

                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     scale: .2,
                        //     fit: BoxFit.fill,
                        //     image: NetworkImage(
                        //       "https://mediastudies.ugis.berkeley.edu/wp-content/themes/sydney-pro-child/images/user-default.png",
                        //     ),
                        //   ),
                        //   borderRadius: BorderRadius.circular(
                        //     10,
                        //   ),
                        //   border: Border.all(
                        //     width: 2,
                        //     color: Colors.white,
                        //     style: BorderStyle.solid,
                        //   ),
                        // ),

                      } else if (snapshot.hasData) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/profile',
                            );
                          },
                          child: Container(
                            height: kContainerCircRad,
                            width: kContainerCircRad,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  snapshot.data,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              border: Border.all(
                                width: 2,
                                color: Colors.white,
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/profile',
                          );
                        },
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
    //   child: Material(
    //     elevation: 10.0,
    //     borderRadius: BorderRadius.circular(kRadiusNumber),
    //     color: Colors.black,
    //     child: Container(
    //       height: 50,
    //       width: double.infinity,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: <Widget>[
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(context, '/home');
    //             },
    //             child: Image.asset(
    //               'images/home_icon.png',
    //               height: kNavIconImageHeight,
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(
    //                 context,
    //                 '/srch',
    //               );
    //             },
    //             child: Image.asset(
    //               'images/search_icon.png',
    //               height: kNavIconImageHeight,
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(
    //                 context,
    //                 '/upload',
    //               );
    //               print('success');
    //               // getImageGallery();
    //             },
    //             child: Image.asset(
    //               'images/post_icon.png',
    //               height: kNavIconImageHeight,
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(
    //                 context,
    //                 '/dms',
    //               );
    //             },
    //             child: Image.asset(
    //               'images/dm_icon.png',
    //               height: kNavIconImageHeight,
    //             ),
    //           ),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(
    //                 context,
    //                 '/profile',
    //               );
    //             },
    //             child: CircleAvatar(
    //               radius: 10,
    //               backgroundColor: Colors.white,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );


// class OldNavBar extends StatefulWidget {
//   const OldNavBar({Key key}) : super(key: key);

//   @override
//   _OldNavBarState createState() => _OldNavBarState();
// }

// class _OldNavBarState extends State<OldNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: vNormalButtonHeight,
//       width: vBiggerButtonWidth,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: lLowGradClr,
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//         ),
//         border: Border.all(
//           color: Colors.black,
//           width: 1.0,
//         ),
//         color: kBaseWidgetColor,
//         borderRadius: BorderRadius.circular(
//           kRadiusNumber,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Image.asset(
//             'images/home_icon.png',
//             height: kNavIconImageHeight,
//           ),
//           Image.asset(
//             'images/search_icon.png',
//             height: kNavIconImageHeight,
//           ),
//           Image.asset(
//             'images/post_icon.png',
//             height: kNavIconImageHeight,
//           ),
//           Image.asset(
//             'images/dm_icon.png',
//             height: kNavIconImageHeight,
//           ),
//           CircleAvatar(
//             radius: 10,
//             backgroundColor: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }


