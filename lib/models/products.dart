import 'package:flutter/material.dart';

class Post {

  final String imageUrl;

  final String releaseDate;

  final String productName;

  final String description;

  final String colorWay;

  final String shoeSize;

  final String? productId;

  Post(
      { this.productId,
      required this.imageUrl,
      required this.releaseDate,
      required this.productName,
      required this.description,
      required this.colorWay,
      required this.shoeSize,
      required String userId});
}