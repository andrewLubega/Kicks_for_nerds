import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/components/post_frames_comp/stories/active_stories.dart';
import 'package:kicks_for_nerds/models/product.dart';

import 'package:kicks_for_nerds/screens/empty%20pages/cam_page.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/message_page.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/store_page.dart';
import 'package:kicks_for_nerds/screens/empty%20pages/tagged_page.dart';

import 'package:kicks_for_nerds/screens/finished%20pages/landing_page.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/login_page.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/first_register_page.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/loading_page.dart';

import 'package:kicks_for_nerds/screens/finished%20pages/second_register_page.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/forgot_password.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/settings_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/LegalName_update.dart';
import 'package:kicks_for_nerds/screens/working%20pages/banner_upload_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/bio_update_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/content_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/Home_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/Search_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/dms_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/product_upload.dart';
import 'package:kicks_for_nerds/screens/finished%20pages/profile_pic_upload_page.dart';
import 'package:kicks_for_nerds/screens/working%20pages/username_update_page.dart';

import 'screens/users/current user/profile_page.dart';
import 'screens/finished pages/upload_options_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KicksForNerds());
}

class KicksForNerds extends StatelessWidget {
  const KicksForNerds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product? product;

    return MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData.dark(),
        routes: {
          // '/stories': (context) => StoriesUploadPage(),
          '/upload': (context) => UploadOptions(),
          '/bio': (context) => BioUploadPage(),
          '/user': (context) => UsernameUpdatePage(),
          '/msg': (context) => MessagePage(),
          '/land': (context) => LandingPage(),
          '/reg': (context) => FirstRegisterPage(),
          '/regtwo': (context) => SecondRegisterPage(),
          '/log': (context) => LoginPage(),
          '/load': (context) => LoadingPage(),
          '/home': (context) => HomePage(),
          // '/search': (context) => SearchPage(),
          '/dms': (context) => Dmspage(),
          '/active_story': (context) => ActiveStoryPage(),
          '/profile': (context) => ProfilePage(),
          '/forgot': (context) => ForgotPasswordPage(),
          '/posts': (context) => PostsUploadPage(),
          '/srch': (context) => SearchPage(),
          '/set': (context) => SettingsPage(),
          '/tag': (context) => TaggedPage(),
          '/store': (context) => StorePage(),
          '/cam': (context) => CamPage(),

          '/content': (context) => PostContentPage(product),
          // '/shop': (context) => ShoppingPage(),
          // '/userName': (context) => UserNamePage(),
          '/name': (context) => LegalNameUpdatePage(),

          '/pic_pfp': (context) => ProfilePicUploadPage(),
          '/banner': (context) => BannerProfileUplaod(),
        },
        home: AuthWrapper());
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }
        return LandingPage();
      },
    );
  }
}
