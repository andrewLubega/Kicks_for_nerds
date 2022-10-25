import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/services/cam.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/story_frame.dart';

class UpperHomeSec extends StatefulWidget {
  const UpperHomeSec({Key? key}) : super(key: key);

  @override
  State<UpperHomeSec> createState() => _UpperHomeSecState();
}

class _UpperHomeSecState extends State<UpperHomeSec> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            72,
            24,
            0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // CamAndGallery().;
                  // CamAndGallery().pickImage(ImageSource.camera);
                },
                child: Image.asset(
                  'images/cam_arrow.png',
                  height: kIconImageHeight,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, '/shop');
                  });
                },
                child: Image.asset(
                  'images/shop_arrow.png',
                  height: kIconImageHeight,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Container(
            width: double.infinity,
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) => StoryFrame(
                size: 72.0,
                storyImage: 'images/ttc.png',
              ),
              separatorBuilder: (context, int index) => SizedBox(
                height: 40,
                width: 24,
              ),
              itemCount: 20,
            ),
          ),
        ),
      ],
    );
  }
}
