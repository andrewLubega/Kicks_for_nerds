import 'package:kicks_for_nerds/components/nav_bar.dart';

import 'posts_upload_page.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/custom_back_button.dart';
import 'package:kicks_for_nerds/components/reusable_buttons.dart';
import 'package:kicks_for_nerds/services/auth.dart';
import 'package:provider/provider.dart';

class UploadOptions extends StatefulWidget {
  const UploadOptions({Key key}) : super(key: key);

  @override
  State<UploadOptions> createState() => _UploadOptionsState();
}

class _UploadOptionsState extends State<UploadOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGClr,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                    ),
                    child: BiggerButton(
                      title: 'Posts',
                      onPressed: () {
                        setState(
                          () {
                            Navigator.pushNamed(
                              context,
                              '/posts',
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                    ),
                    child: BiggerButton(
                      title: 'Stories',
                      onPressed: () {
                        setState(() {
                          Navigator.pushNamed(
                            context,
                            '/stories',
                          );
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
