import 'package:flutter/material.dart';

import '../../assets/constants.dart';
import '../../assets/variables.dart';
import '../../components/buttons_comp/bigger_button.dart';
import '../../components/buttons_comp/stroke_button.dart';
import '../../components/custom_back_button.dart';
import '../../services/database.dart';

class BioUploadPage extends StatelessWidget {
  String bioInfo = '';

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
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomBackButton(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 36, 0, 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Update Bio',
                          style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 36,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Column(
                    children: <Widget>[
                      StrokeButtonField(
                        hiddenPass: false,
                        onChangedProperty: (val) {
                          bioInfo = val.toString();
                          // print(text);
                        },
                        txt: 'bio',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12,
                        ),
                        child: BiggerButton(
                          onPressed: () async {
                            await DataBase().updateBio(
                              bioInfo,
                            );
                          },
                          title: 'update',
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
