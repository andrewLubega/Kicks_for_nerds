import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/store_page.dart';

class Post {
  final String imageUrl;
  final String title;
  final String text;

  Post(
      {@required this.imageUrl,
      @required this.title,
      @required this.text,
      String userId});
  // Post.fromSnapShot(
  //   {
  //     DataSnapshot snapshot
  //   }
  // );
}

class Stories {
  final String imageUrl;

  Stories({@required this.imageUrl, @required String userId});
}
