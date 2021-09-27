import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';
import 'package:kicks_for_nerds/components/profile_search_card.dart';
import 'package:kicks_for_nerds/components/search_card.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              SearchCard(
                txt: "Search",
                hiddenPass: false,
              ),
              ProfileSearchCard(
                handle: '',
                onPressed: null,
                routePage: '',
                username: '',
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
