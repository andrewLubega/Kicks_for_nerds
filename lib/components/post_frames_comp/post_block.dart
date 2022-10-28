import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/models/product.dart';
import 'package:kicks_for_nerds/screens/working%20pages/Content_page.dart';

class PostBlock extends StatefulWidget {
  Product product;

  PostBlock({required this.product});

  @override
  _PostBlockState createState() => _PostBlockState();
}

class _PostBlockState extends State<PostBlock> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PostContentPage(
              widget.product,
            ),
          ),
        );

        // Navigator.pushNamed(context, '/content');
      },
      child: Container(
        width: 101,
        height: 101,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              widget.product.imageUrl,
            ),
          ),
          color: kBaseWidgetColor,
          borderRadius: BorderRadius.circular(
            kCircleRadNumber,
          ),
        ),
      ),
    );
  }
}
