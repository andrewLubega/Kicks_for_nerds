import 'package:flutter/material.dart';
import 'package:kicks_for_nerds/assets/lists.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key key}) : super(key: key);

  @override
  // createstate() {
  //   return _LoadingPageState();
  // }

  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  // void initState() {
  //   super.initState();
  //   startTime();
  // }

  // startTime() async {
  //   var duration = new Duration(seconds: 4);
  //   return new Timer(duration, route);
  // }

  // route() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => ProfilePage(),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: new Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: lReversedGradClr,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset('images/loading_logo.png'),
                SizedBox(height: 20),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     primary: Color(
                //       0x000000FF,
                //     ),
                //   ),
                //   onPressed: () {},
                //   child: Column(
                //     children: <Widget>[
                //       LinearProgressIndicator(),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
