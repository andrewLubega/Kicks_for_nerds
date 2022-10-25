import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    this.onChangedProperty,
  }) : super(key: key);

  final onChangedProperty;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 10,
      ),
      child: Container(
        height: 50,
        width: 327,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextField(
            textAlign: TextAlign.left,
            obscureText: false,
            onChanged: widget.onChangedProperty,
            decoration: InputDecoration(
              icon: ImageIcon(
                AssetImage('images/search_icon.png'),
                color: Colors.grey[600],
                size: 17,
              ),
              contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              hintText: "Search",
              hintStyle: TextStyle(
                fontFamily: 'comfortaa',
                fontSize: kFontSize18,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: kBaseWidgetColor,
          borderRadius: BorderRadius.circular(
            24.0,
          ),
          // border: Border.all(
          //   color: Colors.black,
          //   width: 2.0,
          // ),
        ),
      ),
    );
  }
}
