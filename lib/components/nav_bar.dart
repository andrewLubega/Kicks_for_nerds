import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key key,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _profileImage;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _profileImage = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/srch',
                  );
                },
                child: Image.asset(
                  'images/search_icon.png',
                  height: kNavIconImageHeight,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/upload',
                  );
                  print('success');
                  // getImageGallery();
                },
                child: Image.asset(
                  'images/post_icon.png',
                  height: kNavIconImageHeight,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/dms',
                  );
                },
                child: Image.asset(
                  'images/dm_icon.png',
                  height: kNavIconImageHeight,
                ),
              ),
              GestureDetector(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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


