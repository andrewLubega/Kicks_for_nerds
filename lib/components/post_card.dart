import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class PostCard extends StatefulWidget {
  PostCard(
      {this.height,
      this.width,
      this.baseColour,
      this.cardChild,
      this.marginSize,
      this.grad,
      this.image});

  final marginSize;
  final double height;
  final Color baseColour;
  final Widget cardChild;
  final double width;
  final grad;
  final image;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.cardChild,
      width: widget.width,
      height: widget.height,
      margin: widget.marginSize,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.image),
        ),
        borderRadius: BorderRadius.circular(
          kRadiusNumber,
        ),
        color: widget.baseColour,
        gradient: widget.grad,
      ),
    );
  }
}

// Container(
//       decoration: BoxDecoration(
//     image: DecorationImage(
//           image: NetworkImage(image),
//         ),
//       ),
//     );