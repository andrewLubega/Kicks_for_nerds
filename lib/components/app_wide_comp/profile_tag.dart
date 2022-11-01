import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/services/database.dart';

class ProfileTag extends StatefulWidget {
  const ProfileTag({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileTagState createState() => _ProfileTagState();
}

class _ProfileTagState extends State<ProfileTag> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              child: FutureBuilder(
                future: DataBase().getUsername(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                      "@Username",
                      style: TextStyle(
                        color: kDarkModefont,
                        fontSize: 10,
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return Text(
                      snapshot.data,
                      style: TextStyle(
                        color: kDarkModefont,
                        fontSize: 10,
                      ),
                    );
                  }
                  return Text(
                    "@username",
                    style: TextStyle(
                      color: kDarkModefont,
                      fontSize: 10,
                    ),
                  );
                },
              ),
              // child: Text(
              //   FirebaseAuth.instance.currentUser!.email.toString(),
              //   style: TextStyle(
              //     color: kDarkModefont,
              //     fontSize: 10,
              //   ),
              // ),
            ),
          ),
        ),
      ],
    );
  }
}
