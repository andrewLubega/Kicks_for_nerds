import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: Column(
        children: <Widget>[
          Text(
            'Search not done yet',
            style: TextStyle(
              fontFamily: 'Comfortaa',
              fontSize: kFontSize18,
            ),
          ),
        ],
      ),
    );
  }
}
