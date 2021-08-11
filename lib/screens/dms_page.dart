import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';

class Dmspage extends StatefulWidget {
  const Dmspage({Key key}) : super(key: key);

  @override
  _DmspageState createState() => _DmspageState();
}

class _DmspageState extends State<Dmspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Dms not done yet',
              style: TextStyle(
                fontFamily: 'Comfortaa',
                fontSize: kFontSize18,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
