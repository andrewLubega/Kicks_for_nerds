import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
