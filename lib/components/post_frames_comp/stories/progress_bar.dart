import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// class MyProgressBar extends StatefulWidget {
//   const MyProgressBar({Key key}) : super(key: key);

//   @override
//   State<MyProgressBar> createState() => _MyProgressBarState();
// }

// class _MyProgressBarState extends State<MyProgressBar> {

//   doub
//   @override
//   Widget build(BuildContext context) {
//     return LinearPercentIndicator(
//       lineHeight: 15,
//       percent: 0.3,
//       progressColor: Colors.white,
//       backgroundColor: Colors.grey[600],
//     );
//   }
// }

class MyProgressBar extends StatelessWidget {
  double percentWatched = 0.0;

  MyProgressBar({
    required this.percentWatched,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 10,
      percent: percentWatched,
      barRadius: Radius.circular(kRadiusNumber),
      progressColor: Colors.grey[300],
      backgroundColor: Colors.grey[600],
    );
  }
}
