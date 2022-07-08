import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/nav_bar.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/components/reusable_card.dart';
import 'package:kicks_for_nerds/components/stroke_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';
import 'package:kicks_for_nerds/screens/home_page.dart';
import 'package:kicks_for_nerds/services/database.dart';

class StoriesUploadPage extends StatefulWidget {
  const StoriesUploadPage({Key key}) : super(key: key);

  @override
  State<StoriesUploadPage> createState() => _StoriesUploadState();
}

class _StoriesUploadState extends State<StoriesUploadPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  var _profileImage;

  final picker = ImagePicker();

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

  File sampleImage;
  String _myValue;
  String url;
  final formKey = new GlobalKey<FormState>();

  Future getImage() async {
    var tempImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage as File;
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate() != null) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<void> uploadStatusImage() async {
    if (true) {
      print('getting there');
      final postImageRef = FirebaseStorage.instance.ref().child("Post Images");

      var timeKey = new DateTime.now();
      print('getting there 2');

      final imageRef = postImageRef.child(timeKey.toString() + ".jpg");

      await imageRef.putFile(_profileImage);

      var imageUrl = await imageRef.getDownloadURL();
      url = imageUrl.toString();

      print("ImageUrl = " + url);

      // goToHomePage();

      // saveToDatabase(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: new GlobalKey<FormState>(),
      backgroundColor: kBGClr,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomBackButton(),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 0, 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Stories',
                    style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 36,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundColor: kBaseWidgetColor,

                  child: _profileImage == null
                      ? Center(
                          child: Text(
                            "Image not loaded",
                          ),
                        )
                      : NetworkImage(
                          _profileImage,
                        ),

                  // ClipContext()()(
                  //     child: Container(
                  //       height: 100,
                  //       width: 100,
                  //       child: Image.file(
                  //         _profileImage,
                  //         fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //   ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: BiggerButton(
                    onPressed: () {
                      getImageGallery();
                    },
                    title: 'Gallery',
                    buttonHeight: vNormalButtonHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                  ),
                  child: BiggerButton(
                    onPressed: () async {
                      await uploadStatusImage();
                      await DataBase().saveStory(
                        imageUrl: url,
                      );
                    },
                    title: 'Post',
                    buttonHeight: vNormalButtonHeight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
