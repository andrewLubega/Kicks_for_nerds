import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/lists.dart';
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MidHomeSec extends StatefulWidget {
  const MidHomeSec({Key key}) : super(key: key);

  @override
  State<MidHomeSec> createState() => _MidHomeSecState();
}

class _MidHomeSecState extends State<MidHomeSec> {
  PageController _pageController;
  int num = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            child: PageView.builder(
              pageSnapping: true,
              controller: _pageController,
              itemCount: lPostBlockList.length,
              itemBuilder: (context, int index) {
                return MyCard(
                  marginSize: EdgeInsets.all(10),
                  baseColour: kBaseWidgetColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
