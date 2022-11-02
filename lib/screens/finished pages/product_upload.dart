import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  const PostsUploadPage({Key? key}) : super(key: key);

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

  File? sampleImage;
  // String _myValue;
  String? url;
  final formKey = new GlobalKey<FormState>();

  Future getImage() async {
    var tempImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = tempImage as File;
    });
  }

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form!.validate() != null) {
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

      print("ImageUrl = " + url!);
    }
  }

  String releaseDate = '';

  String productName = '';

  String description = '';

  String colorWay = '';

  String shoeSize = ' ';

  String price = ' ';

  String dropdownvalue = "Select a release date";
  String dropdownvalue_2 = "Select a colorway";
  String dropdownvalue_3 = "Select a shoe size";

  var releaseDateItems = [
    'Select a release date',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
    '2017',
    '2016',
    '2015',
    '2014',
    '2013',
    '2012',
    '2011',
    '2010',
    '2009',
    '2008',
    '2007',
    '2006',
    '2005',
    '2004',
    '2003',
    '2002',
    '2001',
    '2000',
  ];

  var colorWayItems = [
    'Select a colorway',
    'Red',
    'Yellow',
    'Blue',
    'Green',
    'Pink',
    'Grey',
    'White',
    'Brown',
    'Black',
    'Gold',
    'Silver',
    'Platnum',
  ];

  var shoeSizeItems = [
    'Select a shoe size',
    '14.5',
    '14',
    '13.5',
    '13',
    '12.5',
    '12',
    '11.5',
    '11',
    '10.5',
    '10',
    '9.5',
    '9',
    '8.5',
    '8',
    '7.5',
    '7',
    '6.5',
    '6',
    '5.5',
    '5',
  ];

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
                          productName = val.toString();
                          // print(text);
                        },
                        txt: 'Product name',
                      ),
                      StrokeButtonField(
                        hiddenPass: false,
                        onChangedProperty: (val) {
                          description = val.toString();
                          // print(text);
                        },
                        txt: 'Description',
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     left: 24.0,
                      //     right: 24.0,
                      //     top: 10,
                      //   ),
                      //   child: Container(
                      //     child: TextField(
                      //       onChanged: ((value) {
                      //         price = int.parse(value).toString();
                      //       }),
                      //       keyboardType: TextInputType.number,
                      //       inputFormatters: <TextInputFormatter>[
                      //         FilteringTextInputFormatter.digitsOnly
                      //       ],
                      //       decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.fromLTRB(
                      //           24,
                      //           30,
                      //           24,
                      //           0,
                      //         ),
                      //         labelText: 'Price',
                      //         labelStyle: TextStyle(
                      //           fontFamily: 'Roboto',
                      //           fontSize: kFontSize12,
                      //         ),
                      //         border: OutlineInputBorder(
                      //           borderSide: BorderSide.none,
                      //         ),
                      //       ),
                      //     ),
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(
                      //         24.0,
                      //       ),
                      //       border: Border.all(
                      //         color: Colors.black,
                      //         width: 2.0,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          right: 24.0,
                          top: 10,
                        ),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              96.5,
                              0,
                              96.5,
                              0,
                            ),
                            child: DropdownButton(
                              icon: Icon(Icons.arrow_drop_down),
                              value: dropdownvalue,
                              items: releaseDateItems.map(
                                (String items) {
                                  return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: items,
                                    child: Text(items),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                  releaseDate = newValue.toString();
                                });
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              24.0,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          right: 24.0,
                          top: 10,
                        ),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              109,
                              0,
                              109,
                              0,
                            ),
                            child: DropdownButton(
                              icon: Icon(Icons.arrow_drop_down),
                              value: dropdownvalue_2,
                              items: colorWayItems.map(
                                (String items) {
                                  return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: items,
                                    child: Text(items),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue_2 = newValue!;
                                  colorWay = newValue.toString();
                                });
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              24.0,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          right: 24.0,
                          top: 10,
                        ),
                        child: Container(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              105,
                              0,
                              105,
                              0,
                            ),
                            child: DropdownButton(
                              icon: Icon(Icons.arrow_drop_down),
                              value: dropdownvalue_3,
                              items: shoeSizeItems.map(
                                (String items) {
                                  return DropdownMenuItem(
                                    alignment: AlignmentDirectional.center,
                                    value: items,
                                    child: Text(items),
                                  );
                                },
                              ).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue_3 = newValue!;
                                  shoeSize = newValue.toString();
                                });
                              },
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              24.0,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                        ),
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
                              // price: price,
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
