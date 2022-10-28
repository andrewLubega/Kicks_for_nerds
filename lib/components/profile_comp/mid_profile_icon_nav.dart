import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/loading_page.dart';
import 'package:kicks_for_nerds/services/database.dart';

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
              FutureBuilder(
                future: DataBase().getProductLength(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return LoadingPage();
                  } else if (snapshot.hasData) {
                    return Text(
                      snapshot.data.toString(),
                      style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: kFontSize14,
                        fontWeight: kBoldTxt,
                      ),
                    );
                  }
                  return Text(
                    "0",
                    style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: kFontSize14,
                      fontWeight: kBoldTxt,
                    ),
                  );
                },
              ),
              // Text(
              //   DataBase().getPostLength().toString(),
              //   style: TextStyle(
              //     fontFamily: 'roboto',
              //     fontSize: kFontSize14,
              //     fontWeight: kBoldTxt,
              //   ),
              // ),
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
