import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


class CamAndGallery extends StatefulWidget {
  const CamAndGallery({Key key}) : super(key: key);

  @override
  _CamAndGalleryState createState() => _CamAndGalleryState();
}

class _CamAndGalleryState extends State<CamAndGallery> {
  var _profileImage;
  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _profileImage = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getImageGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _profileImage = File(pickedImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
