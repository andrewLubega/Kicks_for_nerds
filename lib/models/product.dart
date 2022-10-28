import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/store_page.dart';

class Product {
  final String imageUrl;

  final String releaseDate;

  final String productName;

  final String description;

  final String colorWay;

  final String shoeSize;

  Product(
      {required this.imageUrl,
      required this.releaseDate,
      required this.productName,
      required this.description,
      required this.colorWay,
      required this.shoeSize,
      required String userId});

  factory Product.fromjson(json) {
    return Product(
      imageUrl: json['imageUrl'],
      releaseDate: json['release_date'],
      productName: json['product_name'],
      description: json['description'],
      colorWay: json['colorway'],
      shoeSize: json['shoeSize'],
      userId: json['userUid'],
    );
  }
}

class Story {
  final String imageUrl;

  Story({
    required this.imageUrl,
    required String userId,
  });
}
