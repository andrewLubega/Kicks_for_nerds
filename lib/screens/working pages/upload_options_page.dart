import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/components/app_wide_comp/nav_bar.dart';
import 'package:kicks_for_nerds/components/buttons_comp/bigger_button.dart';

class UploadOptions extends StatefulWidget {
  const UploadOptions({Key? key}) : super(key: key);

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
