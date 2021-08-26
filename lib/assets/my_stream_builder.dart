import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/enums.dart';
import 'package:kicks_for_nerds/screens/loading_page.dart';

class MyStreamBuilder extends StatefulWidget {
  MyStreamBuilder({
    this.userUid,
    this.valueKey,
    this.location,
    this.fontWeight,
    this.clrs,
    @required this.fontSize,
  });

  final userUid;
  final valueKey;
  final location;
  Color clrs;
  double fontSize;
  FontWeight fontWeight;

  @override
  _MyStreamBuilderState createState() => _MyStreamBuilderState();
}

class _MyStreamBuilderState extends State<MyStreamBuilder> {
  final connection = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: connection.child(widget.location).child(widget.userUid).onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            snapshot.connectionState == ConnectionState.waiting
                ? LoadingPage()
                : Container();
          }
          print(
            "snapshot: ${snapshot.data.snapshot.value['${widget.valueKey}']}",
          );
          print("snapshot: ${snapshot.data.snapshot.value}");
          return Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Text(
              (snapshot.hasData)
                  ? '${snapshot.data.snapshot.value[widget.valueKey]}'
                  : widget.valueKey,
              style: TextStyle(
                color: widget.clrs,
                fontSize: widget.fontSize,
                fontFamily: 'Roboto',
                fontWeight: widget.fontWeight,
              ),
            ),
          );
        });
  }
}
