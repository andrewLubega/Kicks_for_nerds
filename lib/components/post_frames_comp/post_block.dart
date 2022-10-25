import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class PostBlock extends StatefulWidget {
  const PostBlock({
    Key? key,
  }) : super(key: key);

  @override
  _PostBlockState createState() => _PostBlockState();
}

class _PostBlockState extends State<PostBlock> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/content');
      },
      child: Container(
        width: 101,
        height: 101,
        decoration: BoxDecoration(
          color: kBaseWidgetColor,
          borderRadius: BorderRadius.circular(
            kCircleRadNumber,
          ),
        ),
      ),
    );
  }
}
