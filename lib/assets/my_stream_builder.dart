// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:kicks_for_nerds/models/myAppUser.dart';
// import 'package:kicks_for_nerds/screens/finished%20pages/loading_page.dart';

// class MyStreamBuilder extends StatefulWidget {
//   MyStreamBuilder({
//     this.userUid,
//     this.valueKey,
//     this.location,
//     this.fontWeight,
//     this.clrs,
//     @required this.fontSize,
//   });

//   final userUid;
//   final valueKey;
//   final location;
//   Color clrs;
//   double fontSize;
//   FontWeight fontWeight;

//   @override
//   _MyStreamBuilderState createState() => _MyStreamBuilderState();
// }

// class _MyStreamBuilderState extends State<MyStreamBuilder> {
//   final connection = FirebaseDatabase.instance.reference();

//   getText(currentUser) {
//     String textResult = "";
//     if (widget.location == "name") {
//       textResult = currentUser.name;
//     } else {
//       textResult = currentUser.userName;
//     }
//     return textResult;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: connection.child('users').child(widget.userUid).onValue,
//       // ignore: missing_return
//       builder: (context, AsyncSnapshot<Event> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return LoadingPage();
//         }
//         if (snapshot.hasData) {
//           // print(snapshot.data.snapshot.value);
//           if (snapshot.data != null) {
//             print(snapshot.data.snapshot.value);
//             Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
//             // print(snapshot.data.snapshot.value);
//             // print(widget.location);
//             print(widget.userUid);
//             // print(map);
//             // print(snapshot.data);

//             MyAppUser currentUser = MyAppUser(
//               uid: map['uid'],
//               email: map['email'],
//               userName: map['userName'],
//               name: map['name'],
//             );
//             // print(map['uid']);

//             return Padding(
//               padding: const EdgeInsets.only(
//                 left: 5,
//                 right: 5,
//               ),
//               child: Text(
//                 // TODO uncommented currentUser
//                 "${getText(currentUser)}",
//                 style: TextStyle(
//                   color: widget.clrs,
//                   fontSize: widget.fontSize,
//                   fontFamily: 'Roboto',
//                   fontWeight: widget.fontWeight,
//                 ),
//               ),
//             );
//           }
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
