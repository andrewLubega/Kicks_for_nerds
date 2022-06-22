import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/constants.dart';
import 'package:kicks_for_nerds/models/myAppUser.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/cam_page.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/shopping_page.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/store_page.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/tagged_page.dart';
import 'package:kicks_for_nerds/screens/handle_page.dart';
import 'package:kicks_for_nerds/screens/landing_page.dart';
import 'package:kicks_for_nerds/screens/login_page.dart';
import 'package:kicks_for_nerds/screens/first_register_page.dart';
import 'package:kicks_for_nerds/screens/loading_page.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/dms_page.dart';
import 'package:kicks_for_nerds/screens/home_page.dart';
import 'package:kicks_for_nerds/screens/profile_page.dart';
import 'package:kicks_for_nerds/screens/search_page.dart';
import 'package:kicks_for_nerds/screens/second_register_page.dart';
import 'package:kicks_for_nerds/screens/forgot_password.dart';
import 'package:kicks_for_nerds/screens/settings_page.dart';
import 'package:kicks_for_nerds/screens/upload_page.dart';
import 'package:kicks_for_nerds/screens/username_page.dart';
import 'package:kicks_for_nerds/services/auth.dart';
import 'package:kicks_for_nerds/screens/search_page.dart';
import 'package:kicks_for_nerds/services/database.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KicksForNerds());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _intialized = false;
  bool _error = false;

//connecting to firebase
  // void intializeFlutterFire() async {
  //   try {
  //     await Firebase.initializeApp();
  //     setState(() {
  //       _intialized = true;
  //     });
  //   } catch (e) {
  //     print(
  //       e.toString(),
  //     );
  //     _error = true;
  //   }
  // }

  @override
  // void initState() {
  //   intializeFlutterFire();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    //   if (_error) {
    //     return Container();
    //   }

    //   if (!_intialized) {
    //     //return container or loading screen
    //     return LoadingPage();
    //   }
    //   return Streamer();
    //   // return MaterialApp(

    //   // );
    // }
  }

//   initialRoute: '/land',

// class Streamer extends StatefulWidget {
//   const Streamer({Key key}) : super(key: key);

//   @override
//   _StreamerState createState() => _StreamerState();
// }

// class _StreamerState extends State<Streamer> {
//   final _streamProvider = AuthService().user;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: {
//         '/land': (context) => LandingPage(),
//         '/reg': (context) => FirstRegisterPage(),
//         '/regtwo': (context) => SecondRegisterPage(),
//         '/log': (context) => LoginPage(),
//         '/load': (context) => LoadingPage(),
//         '/home': (context) => HomePage(),
//         '/search': (context) => SearchPage(),
//         '/dms': (context) => Dmspage(),
//         '/profile': (context) => ProfilePage(),
//         '/forgot': (context) => ForgotPasswordPage(),
//         '/upload': (context) => UploadPage(),
//         '/srch': (context) => SearchPage(),
//       },
//       home: StreamBuilder(
//         stream: _streamProvider,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.data == null) {
//             return snapshot.connectionState == ConnectionState.waiting
//                 ? LoadingPage()
//                 // using to edit pages
//                 : LoginPage();
//           } else {
//             // switch this to profile when done
//             return LandingPage();
//           }
//         },
//       ),
//     );
//   }
// }

// service firebase.storage {
//   match /b/{bucket}/o {
//     match /{allPaths=**} {
//       allow read, write: if request.auth != null;
//     }
//   }
// }

}

class KicksForNerds extends StatelessWidget {
  const KicksForNerds({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/land': (context) => LandingPage(),
          '/reg': (context) => FirstRegisterPage(),
          '/regtwo': (context) => SecondRegisterPage(),
          '/log': (context) => LoginPage(),
          '/load': (context) => LoadingPage(),
          '/home': (context) => HomePage(),
          '/search': (context) => SearchPage(),
          '/dms': (context) => Dmspage(),
          '/profile': (context) => ProfilePage(),
          '/forgot': (context) => ForgotPasswordPage(),
          '/upload': (context) => UploadPage(),
          '/srch': (context) => SearchPage(),
          '/set': (context) => SettingsPage(),
          '/tag': (context) => TaggedPage(),
          '/store': (context) => StorePage(),
          '/cam': (context) => CamPage(),
          '/shop': (context) => ShoppingPage(),
          '/user': (context) => UserNamePage(),
          '/handle': (context) => HandlePage(),
        },
        home: AuthWrapper());
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.hasData) {
            return HomePage();
          } else if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          }
          return LandingPage();
        });
  }
}
