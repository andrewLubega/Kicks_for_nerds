import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/assets/variables.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/nav_bar.dart';
import 'package:kicks_for_nerds/components/buttons_comp/bigger_button.dart';
import 'package:kicks_for_nerds/components/buttons_comp/stroke_button.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:kicks_for_nerds/components/my_comp/my_card.dart';

import 'package:kicks_for_nerds/services/database.dart';

class PostsUploadPage extends StatefulWidget {
  const PostsUploadPage({Key key}) : super(key: key);

  @override
  _PostsUploadPageState createState() => _PostsUploadPageState();
}

class _PostsUploadPageState extends State<PostsUploadPage> {
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
  // String _myValue;
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
      print('getting here');
      final postImageRef = FirebaseStorage.instance.ref().child("Post Images");

      var timeKey = new DateTime.now();
      print('getting here 2');

      final imageRef = postImageRef.child(timeKey.toString() + ".jpg");

      await imageRef.putFile(_profileImage);

      var imageUrl = await imageRef.getDownloadURL();
      url = imageUrl.toString();

      print("ImageUrl = " + url);

      // goToHomePage();

      // saveToDatabase(url);
    }
  }

  // void saveToDatabase(url) {
  //   var dbTimeKey = new DateTime.now();
  //   var formatDate = new DateFormat('MMM d, yyyy');
  //   var formtTime = new DateFormat('EEEE, hh:mm aaa');

  //   String date = formatDate.format(dbTimeKey);
  //   String time = formtTime.format(dbTimeKey);

  //   DatabaseReference ref = FirebaseDatabase.instance.reference();

  //   var data = {
  //     "image": url,
  //     "description": _myValue,
  //     "date": date,
  //     "time": time,
  //   };

  //   ref.child("Posts").push().set(data);
  // }

  // void goToHomePage() {
  //   Navigator.pushNamed(
  //     context,
  //     '/home',
  //   );
  // }
  String releaseDate = '';

  String productName = '';

  String description = '';

  String colorWay = '';

  String shoeSize = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: new GlobalKey<FormState>(),
      backgroundColor: kBGClr,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 72,
              ),
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
                          'Posts',
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
                      GestureDetector(
                        onTap: () {
                          getImageGallery();
                        },
                        child: MyCard(
                          marginSize: kContentMargin,
                          width: double.infinity,
                          height: 200,
                          baseColour: kBaseWidgetColor,
                          cardChild: _profileImage == null
                              ? Center(
                                  child: Text("Image not loaded"),
                                )
                              : Image.file(
                                  _profileImage,
                                ),
                        ),
                      ),
                      StrokeButtonField(
                        hiddenPass: false,
                        onChangedProperty: (val) {
                          releaseDate = val.toString();
                          // print(text);
                        },
                        txt: 'Release date',
                      ),
                      StrokeButtonField(
                        hiddenPass: false,
                        onChangedProperty: (val) {
                          description = val.toString();
                          // print(text);
                        },
                        txt: 'Description',
                      ),
                      StrokeButtonField(
                        hiddenPass: false,
                        onChangedProperty: (val) {
                          productName = val.toString();
                          // print(text);
                        },
                        txt: 'Product name',
                      ),
                      StrokeButtonField(
                        hiddenPass: false,
                        onChangedProperty: (val) {
                          colorWay = val.toString();
                          // print(text);
                        },
                        txt: 'Colorway',
                      ),
                      StrokeButtonField(
                        hiddenPass: false,
                        onChangedProperty: (val) {
                          shoeSize = val.toString();
                          // print(text);
                        },
                        txt: 'Size',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: BiggerButton(
                          onPressed: () async {
                            await uploadStatusImage();
                            await DataBase().savePost(
                              colorway: colorWay,
                              releaseDate: releaseDate,
                              description: description,
                              shoeSize: shoeSize,
                              productName: productName,
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
          ),
        ],
      ),
    );
  }
}


// SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             CustomBackButton(),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(24, 36, 0, 36),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Posts',
//                     style: TextStyle(
//                       fontFamily: 'Comfortaa',
//                       fontSize: 36,
//                     ),
//                     textAlign: TextAlign.left,
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               children: <Widget>[
//                 MyCard(
//                   marginSize: kContentMargin,
//                   width: double.infinity,
//                   height: 200,
//                   baseColour: kBaseWidgetColor,
//                   cardChild: _profileImage == null
//                       ? Center(
//                           child: Text("Image not loaded"),
//                         )
//                       : Image.file(
//                           _profileImage,
//                         ),
//                 ),
//                 StrokeButtonField(
//                   hiddenPass: false,
//                   onChangedProperty: (val) {
//                     title = val.toString();
//                     // print(text);
//                   },
//                   txt: 'Title',
//                 ),
//                 StrokeButtonField(
//                   hiddenPass: false,
//                   onChangedProperty: (val) {
//                     text = val.toString();
//                     // print(text);
//                   },
//                   txt: 'Text',
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 12,
//                   ),
//                   child: BiggerButton(
//                     onPressed: () {
//                       getImageGallery();
//                     },
//                     title: 'Gallery',
//                     buttonHeight: vNormalButtonHeight,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 12,
//                   ),
//                   child: BiggerButton(
//                     onPressed: () async {
//                       await uploadStatusImage();
//                       await DataBase().savePost(
//                         title: title,
//                         text: text,
//                         imageUrl: url,
//                       );
//                     },
//                     title: 'Post',
//                     buttonHeight: vNormalButtonHeight,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: NavBar(),
//     );
