import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/content_components.dart/description.dart';
import 'package:kicks_for_nerds/components/content_components.dart/upper_content_sec.dart';

import '../../models/product.dart';

class MidContentSec extends StatefulWidget {
  Product? product;

  MidContentSec(this.product);

  @override
  State<MidContentSec> createState() => _MidContentSecState();
}

class _MidContentSecState extends State<MidContentSec> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.product!.productName}",
                  // "Shoe Name",
                  style: TextStyle(
                    fontFamily: 'comfortaa',
                    fontSize: kFontSize18,
                    fontWeight: kBoldTxt,
                  ),
                ),
              ],
            ),
            Divider(),
            DescriptionBox(
              widget.product,
            ),
          ],
        ),
      ],
    );
  }
}
