import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/screens/landing_page.dart';
import 'package:kicks_for_nerds/screens/login_page.dart';
import 'package:kicks_for_nerds/screens/register_page.dart';
import 'package:kicks_for_nerds/screens/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/load',
      routes: {
        '/land': (context) => LandingPage(),
        '/reg': (context) => RegisterPage(),
        '/log': (context) => LoginPage(),
        '/load': (context) => LoadingPage(),
      },
    );
  }
}
