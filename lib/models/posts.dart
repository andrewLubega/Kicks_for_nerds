import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/store_page.dart';

class Post {
  final String imageUrl;

  final String releaseDate;

  final String productName;

  final String description;

  final String colorWay;

  final String shoeSize;

  Post(
      {@required this.imageUrl,
      @required this.releaseDate,
      @required this.productName,
      @required this.description,
      @required this.colorWay,
      @required this.shoeSize,
      String userId});
}

class Story {
  final String imageUrl;

  Story({@required this.imageUrl, String userId, String});
}
