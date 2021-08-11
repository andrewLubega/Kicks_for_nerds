import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key key}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
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
              'Shop not done yet',
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
