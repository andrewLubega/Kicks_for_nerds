import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBlackCustomClr,
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 42, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DescTxt("Release Date"),
            DescTxt("Description"),
            DescTxt("NickName"),
            DescTxt("Colorway"),
            DescTxt("Size"),
          ],
        ),
      ),
    );
  }
}

class DescTxt extends StatefulWidget {
  final String txt;
  DescTxt(this.txt);

  @override
  _DescTxtState createState() => _DescTxtState();
}

class _DescTxtState extends State<DescTxt> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        "${widget.txt}:",
        softWrap: true,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: kDarkModefont,
          fontFamily: kRoboto,
          fontWeight: kBoldTxt,
          fontSize: kFontSize14,
        ),
      ),
    );
  }
}
