import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';

class TaggedPage extends StatefulWidget {
  const TaggedPage({Key key}) : super(key: key);

  @override
  _TaggedPageState createState() => _TaggedPageState();
}

class _TaggedPageState extends State<TaggedPage> {
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
              'Tagged not done yet',
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
