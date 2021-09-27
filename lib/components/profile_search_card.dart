import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/enums.dart';
import 'package:kicks_for_nerds/assets/lists.dart';

import 'package:kicks_for_nerds/components/reusable_card.dart';

class ProfileSearchCard extends StatefulWidget {
  const ProfileSearchCard({
    Key key,
    @required this.username,
    @required this.handle,
    @required this.routePage,
    @required this.onPressed,
  }) : super(key: key);

  final String routePage;
  final String username;
  final String handle;
  final onPressed;

  @override
  _ProfileSearchCardState createState() => _ProfileSearchCardState();
}

class _ProfileSearchCardState extends State<ProfileSearchCard> {
  font fontType;

  bool hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusNumber),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: hasBeenPressed ? lGradClr : lSolidGrad),
            borderRadius: BorderRadius.circular(kRadiusNumber),
          ),
          child: ReusableCard(
            height: 50,
            width: 327,
            cardChild: Padding(
              padding: const EdgeInsets.all(
                12.0,
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: kBGClr,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "User",
                          style: TextStyle(
                            fontFamily: "comfortaa",
                            fontSize: kFontSize10,
                            fontWeight: kBoldTxt,
                            color: kFontColour,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "handle",
                          style: TextStyle(
                            fontFamily: "comfortaa",
                            color: kFontColour,
                            fontSize: kFontSize10,
                          ),
                          maxLines: 1,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// ReusableCard(
//           height: 50,
//           width: 327,
//           baseColour: kBlackCustomClr,
//           cardChild: Padding(
//             padding: const EdgeInsets.all(
//               12.0,
//             ),
//             child: Row(
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundColor: kBGClr,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Expanded(
//                       child: Text(
//                         "User",
//                         style: TextStyle(
//                           fontFamily: "comfortaa",
//                           fontSize: kFontSize10,
//                           fontWeight: kBoldTxt,
//                           color: kFontColour,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Text(
//                         "handel",
//                         style: TextStyle(
//                           fontFamily: "comfortaa",
//                           color: kFontColour,
//                           fontSize: kFontSize10,
//                         ),
//                         maxLines: 1,
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),