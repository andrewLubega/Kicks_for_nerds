import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

// class CamAndGallery {
//   // var _profileImage;
//   // final picker = ImagePicker();
//   late File image;

//   Future pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);

//       if (image == null) return;

//       final ImageTemp = File(image.path);
//       setState(() => this.image = ImageTemp);
//     } on PlatformException catch (e) {
//       print('Image failed: $e');
//     }
//   }

//   // Future<void> getImageCamera() async {
//   //   final pickedImage = await picker.pickImage(source: ImageSource.camera);
//   //   setState(
//   //     () {
//   //       if (pickedImage != null) {
//   //         _profileImage = File(pickedImage.path);
//   //       } else {
//   //         print('No Image Selected');
//   //       }
//   //     },
//   //   );
//   // }

//   Future<void> getImageGallery() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);

//       if (image == null) return;

//       final ImageTemp = File(image.path);
//       setState(() => this.image = ImageTemp);
//     } on PlatformException catch (e) {
//       print('Image failed: $e');
//     }

//     // final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//     // setState(
//     //   () {
//     //     if (pickedImage != null) {
//     //       _profileImage = File(pickedImage.path);
//     //     } else {
//     //       print('No Image Selected');
//     //     }
//     //   },
//     // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   void setState(Null Function() param0) {}
// }


class CamAndGallery extends StatefulWidget {
  const CamAndGallery({ Key? key}) : super(key: key);

  @override
  _CamAndGalleryState createState() => _CamAndGalleryState();
}

class _CamAndGalleryState extends State<CamAndGallery> {
  var _profileImage;
  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    setState(
      () {
        if (pickedImage != null) {
          _profileImage = File(pickedImage.path);
        } else {
          print('No Image Selected');
        }
      },
    );
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
