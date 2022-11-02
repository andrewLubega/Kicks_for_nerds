import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/profile_tag.dart';
import 'package:kicks_for_nerds/models/product.dart';

class UpperContentSec extends StatefulWidget {
  Product? product;

  UpperContentSec({required this.product});

  @override
  State<UpperContentSec> createState() => _UpperContentSecState();
}

class _UpperContentSecState extends State<UpperContentSec> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                widget.product!.imageUrl,
              ),
            ),
            color: kBaseWidgetColor,
            borderRadius: BorderRadius.circular(
              kRadiusNumber,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            52,
            24,
            0,
          ),
          child: GestureDetector(
            // child: ProfileTag(),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(
                      0x75000000,
                    ),
                    borderRadius: BorderRadius.circular(
                      24,
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        20,
                        7,
                        20,
                        7,
                      ),
                      child: Text(
                        widget.product!.userName,
                        style: TextStyle(
                          color: kDarkModefont,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ),
      ],
    );
  }
}
