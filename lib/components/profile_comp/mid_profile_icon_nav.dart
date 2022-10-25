import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class MidProfileIconNav extends StatefulWidget {
  const MidProfileIconNav({Key? key}) : super(key: key);

  @override
  State<MidProfileIconNav> createState() => _MidProfileIconNavState();
}

class _MidProfileIconNavState extends State<MidProfileIconNav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Text(
                "0",
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: kFontSize14,
                  fontWeight: kBoldTxt,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 75,
                ),
                child: Image.asset(
                  'images/tagged_icon.png',
                  height: kIconImageHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 75,
                ),
                child: Image.asset(
                  'images/bag_icon.png',
                  height: kIconImageHeight,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  right: 24,
                ),
                child: Column(
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
