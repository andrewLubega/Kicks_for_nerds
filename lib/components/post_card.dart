import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class PostCard extends StatelessWidget {
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

  // final <>imagepic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      width: width,
      height: height,
      margin: marginSize,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(image),
        ),
        borderRadius: BorderRadius.circular(
          kRadiusNumber,
        ),
        color: baseColour,
        gradient: grad,
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