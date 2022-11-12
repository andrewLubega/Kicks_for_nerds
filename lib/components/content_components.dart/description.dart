import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';

import '../../models/product.dart';

class DescriptionBox extends StatelessWidget {
  Product? product;

  DescriptionBox(this.product);

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
            DescTxt(
              txt: "Release Date",
              info: product!.releaseDate,
            ),
            DescTxt(
              txt: "Description",
              info: product!.description,
            ),
            DescTxt(
              txt: "Nick Name",
              info: product!.productName,
            ),
            DescTxt(
              txt: "Colorway",
              info: product!.colorWay,
            ),
            DescTxt(
              txt: "Size",
              info: product!.shoeSize,
            ),
          ],
        ),
      ),
    );
  }
}

class DescTxt extends StatefulWidget {
  final String txt;
  final String info;

  DescTxt({
    required this.txt,
    required this.info,
  });

  @override
  _DescTxtState createState() => _DescTxtState();
}

class _DescTxtState extends State<DescTxt> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          Text(
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
          SizedBox(
            width: 5,
          ),
          Text(
            "${widget.info}",
            softWrap: false,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kDarkModefont,
              fontFamily: kRoboto,
              fontWeight: kRegularTxt,
              fontSize: kFontSize14,
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
